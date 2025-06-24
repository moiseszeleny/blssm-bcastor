import numpy as np
from hepaid.hep.utils import resolve_key_chain
from hepaid.hep.utils import check_valid_sample_dict  
from hepaid.hep.utils import create_simple_dict  


from sm.standard_model import SM


import os

#sm = SM('sm/sm_mg5_full_processes_lep_200.json.gz')

def mass_H1_SPheno(sample_dict):
    """
    Calculates the mass for mH1 HEPStack=SphenoStack output.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.

    Returns:
    float or None: The mass for mH1 or None if the sample dictionary is invalid.

    Details:
    1. Validation: The function first checks if the sample_dict is valid using check_valid_sample_dict(sample_dict).
    2. Extract Values:
       - mH1: Extracts the mass of the first Higgs boson (mH1) from the sample_dict using resolve_key_chain.
    4. Return: Returns the computed mH1 or None if the sample dictionary is invalid.
    """
    if check_valid_sample_dict(sample_dict):
        mH1 = resolve_key_chain(
            sample_dict,
            ['SLHA','MASS','entries','25', 'value']
            )
    else:
        mH1 = 1e10

    return mH1

def mass_H2_SPheno(sample_dict):
    """
    Calculates the mass for mH2 HEPStack=SphenoStack output.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.

    Returns:
    float or None: The mass for mH2 or None if the sample dictionary is invalid.
    """
    if check_valid_sample_dict(sample_dict):
        mH2 = resolve_key_chain(
            sample_dict,
            ['SLHA','MASS','entries','35', 'value']
            )
    else:
        mH2 = 1e10

    return mH2

def mhi_masses_SPheno(sample_dict, obj_hep_config):
    """
    Extracts the masses of Higgs bosons from the sample dictionary.

    Parameters:
    sample_dict (dict): A dictionary containing the sample data from HEPStack.
    obj_hep_config (dict): Configuration dictionary for the objective function.

    Returns:
    dict: A dictionary containing the masses of Higgs bosons.
    """
    mH1 = mass_H1_SPheno(sample_dict)
    mH2 = mass_H2_SPheno(sample_dict)
    mhs = {
        'mH1': mH1,
        'mH2': mH2
    }
    output_dict= create_simple_dict(
        obj_hep_config, sample_dict
        )
    output_dict.update(mhs)
    return output_dict


if __name__ == "__main__":
    from hepaid.hep.stack import hep_stack_fn, HEPSTACK
    from hepaid.utils import load_config
    from hepaid.hep.read import SLHA
    from hepaid.hep.utils import extract_element_or_return
    def print_none_key(func):
        def wrapper(nested_dictionary, keys, *args, **kwargs):
            obj = nested_dictionary
            for key, value in obj.items():
                if key=='SLHA':
                    print(f"Key: {key}")
                    print(f"Value: {value}")
            for key in keys:
                try:
                    if obj is not None:
                        obj = obj[key]
                    else:
                        print(f"None encountered at key: {key}")
                        return None
                except KeyError:
                    print(f"KeyError at key: {key}")
                    return None
            return func(nested_dictionary, keys, *args, **kwargs)
        return wrapper
    
    def log_hep_stack_steps(func):
        def wrapper(x, hep_config):
            print("[hep_stack_fn] Starting execution.")
            
            # Step 1: Config loading
            if isinstance(hep_config, str):
                print(f"[hep_stack_fn] Loading configuration from file {hep_config}...")
            else:
                print("[hep_stack_fn] Using existing configuration object...")

            # Call the original function, but intercept the steps inside
            # We need to inline the function steps here for full step-by-step logging
            if isinstance(hep_config, str):
                hep_config_loaded = load_config(hep_config)
            else:
                hep_config_loaded = hep_config
            print("[hep_stack_fn] Configuration loaded.")

            print(f"[hep_stack_fn] Initializing stack '{hep_config_loaded.hep_stack.name}'...")
            hepsmplr = HEPSTACK[hep_config_loaded.hep_stack.name](
                hep_config=hep_config_loaded,
            )
            print("[DEBUG] hepsmplr type:", type(hepsmplr))
            print("[DEBUG] hepsmplr attributes:", dir(hepsmplr))
            #print("[DEBUG] hepsmplr.input_slha:", getattr(hepsmplr, 'input_slha', None))
            #print("[DEBUG] hepsmplr.scan_dir:", getattr(hepsmplr, 'scan_dir', None))
            #print("[DEBUG] hepsmplr.spheno:", getattr(hepsmplr, 'spheno', None))
            #stdout = hepsmplr.spheno.run(hepsmplr.input_slha)
            #print("[DEBUG] stdout type:", type(stdout))
            #print("[DEBUG] stdout SLHA:", SLHA(stdout))
            

           
            if hasattr(hepsmplr, 'hep_config'):
                print("[DEBUG] hepsmplr.hep_config:", hepsmplr.hep_config)

            print("[hep_stack_fn] Running sample method...")
            result = hepsmplr.sample(x)
            print(f"[hep_stack_fn] Sample method completed.")

            print("[hep_stack_fn] Execution finished.")
            return result
        return wrapper
    resolve_key_chain_with_print = print_none_key(resolve_key_chain)
    hep_stack_fn = log_hep_stack_steps(hep_stack_fn)
    # Example usage
    #sample_dict = {
    #    'SLHA': {
    #        'MASS': {
    #            'entries': {
    #                '25': {'value': [125.0]},
    #                '35': {'value': [250.0]}
    #            }
    #    }
    #}
    obj_hep_config= 'configs/mh1_obj_hep.yml'
    hep_stack_cfg = 'configs/sphenostack_config.yaml'
    x= np.array(
            [
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
            3.0  # alp3input
        ]
        )
    sample_dict = hep_stack_fn(
        x,
        hep_config=hep_stack_cfg#,
        #close=True
        )
    #print("Full sample_dict output:")
    #print(sample_dict)
    try:
        mH1 = resolve_key_chain_with_print(
            sample_dict,
            ['SLHA','MASS','entries','25', 'value']
            )
        print(f"mH1: {mH1}")
        mH2 = resolve_key_chain_with_print(
            sample_dict,
            ['SLHA','MASS','entries','35', 'value']
            )
    except KeyError as e:
        print(f"KeyError: {e}. Sample dictionary may not contain the expected structure.")
        mH1 = None
        mH2 = None
    #print(mass_H1_SPheno(sample_dict))
    #print(mass_H2_SPheno(sample_dict))
    #print(mhi_masses_SPheno(sample_dict, obj_hep_config))
