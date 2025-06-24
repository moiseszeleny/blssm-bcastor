# Import the HEP-Stack module
from hepaid.hep.stack import HEPSTACK
from hepaid.hep.utils import check_valid_sample_dict 
from hepaid.hep.utils import create_simple_dict 
import numpy as np

# Initialise the HEP-Stack with a configuration file
#hep_config = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/hepstack_config.yaml"


def sphenostack_fn(x, hep_config):
    """
    Wrapper function for the SPheno HEP-Stack.

    Args:
        x (array-like): The input sample point.
        hep_config (str): Path to the HEP-Stack configuration file.

    Returns:
        dict: The output dictionary from the HEP-Stack.
    """
    hepstack = HEPSTACK['SPhenoStack'](hep_config=hep_config)
    return hepstack.sample(x)

def mhi_masses_SPheno(sample_dict, obj_hep_config):
    """
    Extracts the mH1 and mH2 masses from the sample dictionary.
    
    Args:
        sample_dict (dict): The dictionary containing the SLHA output.
        obj_hep_config (str): Path to the configuration file for HEP-Stack.
        
    Returns:
        dict: A dictionary with mH1 and mH2 masses.
    """
    # Check if the sample_dict is valid
    if check_valid_sample_dict(sample_dict):
        mH1 = sample_dict['SLHA']['MASS']['entries']['25']['value'][0]
        mH2 = sample_dict['SLHA']['MASS']['entries']['35']['value'][0]
    else:
        mH1 = None
        mH2 = None
    mhs = {
            'mH1': mH1,
            'mH2': mH2
        }
    output_dict = create_simple_dict(
        obj_hep_config,
        sample_dict
    )
    if mH1 is not None and mH2 is not None:
        print(f"mH1: {mH1}, mH2: {mH2}")
    output_dict.update(mhs)
    return output_dict

def masses_mH1M2(obj_hep_cfg, hep_stack_cfg):
    """
    Create an output function that uses the HEP-Stack to obtain the mH1 and mH2 masses.
    
    Args:
        obj_hep_cfg (str): Path to the configuration file for HEP-Stack.
        hep_stack_cfg (str): Path to the configuration file for HEP-Stack.
        
    Returns:
        function: A function that takes a sample and returns the mH1 and mH2 masses.
    """
    
    def output_function(x):
        sample_dict = sphenostack_fn(x, hep_config=hep_stack_cfg)
        sample_dict = mhi_masses_SPheno(
            sample_dict, obj_hep_cfg
        )
        return sample_dict
    
    return output_function

if __name__ == "__main__":
    from hepaid.search.objective import Objective
    from hepaid.search.method import bCASTOR
    hep_config = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/configs/sphenostack_config.yaml"
    obj_hep_config= 'configs/mh1_obj_hep.yml'
    # Define a benchmark for sampling
    benchmark_point = [
        -4.0, # lam1input
        -4.0, # lam2input
        -4.0, # lam3input
        -4.0, # lam4input
        -4.0, # lam5input
        -4.0, # lam6input
        0.0, # rho1input
        0.0, # rho2input
        3.0, # alp1input
        -4.0, # alp2input
        -3.0 # alp3input
    ]

    try:
        sample_dict = sphenostack_fn(benchmark_point, hep_config=hep_config)
        # Check if the sample_dict is valid
        #if  check_valid_sample_dict(sample_dict):
        #    output_dict = create_simple_dict(
        #        obj_hep_config,
        #        sample_dict
        #    )
        output_dict = mhi_masses_SPheno(sample_dict, obj_hep_config=obj_hep_config)
        if output_dict['mH1'] is not None and output_dict['mH2'] is not None:
            print(f"Sampled point: {benchmark_point}")
            print(f"mH1: {output_dict['mH1']}, mH2: {output_dict['mH2']}")
        else:
            print("mH1 or mH2 is None. Check the SLHA output.")
    except Exception as e:
        print(f"Error during sampling: {e}")
        exit(1)

    objective_fn = masses_mH1M2(
            obj_hep_cfg=obj_hep_config,
            hep_stack_cfg=hep_config,
            )

    obj = Objective(
        function = objective_fn,
        function_config= obj_hep_config
    )

    bcastor = bCASTOR(
        objective=obj,
        hyper_parameters='configs/bcastor_config.yaml',
        )
    bcastor.run()