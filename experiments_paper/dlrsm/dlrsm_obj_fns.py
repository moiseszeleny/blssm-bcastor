import numpy as np
from hepaid.hep.stack import hep_stack_fn

from hepaid.search.objective import Objective

from dlrsm_functions import mhi_masses_SPheno



def masses_mH1M2(obj_hep_cfg, hep_stack_cfg):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated masses for mH1 to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    def output_function(x):
        sample_dict = hep_stack_fn(
            x,
            hep_config=hep_stack_cfg#,
            #close=True
            )
        sample_dict = mhi_masses_SPheno(
            sample_dict, obj_hep_cfg
            )
        return sample_dict
    
    return output_function


if __name__ == '__main__':
    import numpy as np
    # Test
    hep_stack_cfg = 'configs/sphenostack_config.yaml'
    obj_hep_config= 'configs/mh1_obj_hep.yml'
    objective_fn = masses_mH1M2(
            obj_hep_cfg=obj_hep_config,
            hep_stack_cfg=hep_stack_cfg,
            )

    obj = Objective(
        function = objective_fn,
        function_config= obj_hep_config
    )
    print(obj)
    x = np.array(obj.space.rvs())
    # evaluate in the parameter space up to find a valid point mh1 < 1e5
    #i = 0
    #while True:
    #    i += 1
    #    print(f"Iteration {i}")
    #    x= np.array(
    #        [
    #            np.random.uniform(-4.0, 4.0), # lam1input
    #            np.random.uniform(-4.0, 4.0), # lam2input
    #            np.random.uniform(-4.0, 4.0), # lam3input
    #            np.random.uniform(-4.0, 4.0), # lam4input
    #            np.random.uniform(-4.0, 4.0), # lam5input
    #            np.random.uniform(-4.0, 4.0), # lam6input
    #            np.random.uniform(-4.0, 4.0), # rho1input
    #            np.random.uniform(-4.0, 4.0), # rho2input
    #            np.random.uniform(-4.0, 4.0), # alp1input
    #            np.random.uniform(-4.0, 4.0), # alp2input
    #            np.random.uniform(-4.0, 4.0)  # alp3input
    #        ]
    #    )
    #    try:
    #        result = obj.sample(x, is_normalised=False)
    #        if result['mH1'] < 1e5 and result['mH2'] < 1e5:
    #            break
    #    except Exception as e:
    #        print(f"Error: {e}. Retrying with a new sample.")
    #        x = np.array(obj.space.rvs())

    #print(f"Sampled point: {x}")
    #print(f"Result: {result}")

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
    result = obj.sample(x, is_normalised=False)
    print(result)