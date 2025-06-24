import numpy as np
from hepaid.hep.stack import hep_stack_fn

from hepaid.search.objective import Objective

from blssm_functions import mu_aa_masses_hbhs_mg5
from blssm_functions import mu_aa_bb_masses_hbhs_mg5
from blssm_functions import mus_masses_hbhs_mg5


def all_pheno_obj_fn(obj_hep_cfg, hep_stack_cfg):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated signal strength modifier to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    def output_function(x):
        sample_dict = hep_stack_fn(
            x,
            hep_config=hep_stack_cfg#,
            #close=True
            )
        sample_dict = mus_masses_hbhs_mg5(
            sample_dict, obj_hep_cfg
            )
        return sample_dict
    return output_function

def aa_bb_pheno_obj_fn(obj_hep_cfg, hep_stack_cfg):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated signal strength modifier to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    def output_function(x):
        sample_dict = hep_stack_fn(
            x,
            hep_config=hep_stack_cfg#,
            #close=True
            )
        sample_dict = mu_aa_bb_masses_hbhs_mg5(
            sample_dict, obj_hep_cfg
            )
        return sample_dict
    return output_function

def aa_pheno_obj_fn(obj_hep_cfg, hep_stack_cfg):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated signal strength modifier to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    def output_function(x):
        sample_dict = hep_stack_fn(
            x,
            hep_config=hep_stack_cfg#,
            #close=True
            )
        sample_dict = mu_aa_masses_hbhs_mg5(
            sample_dict, obj_hep_cfg
            )
        return sample_dict
    return output_function


if __name__ == '__main__':
    # Test
    hep_stack_cfg = 'configs/hep_stack_config.yaml'
    obj_hep_config= 'configs/aa_obj_hep.yml'
    objective_fn = aa_pheno_obj_fn(
            obj_hep_cfg=obj_hep_config,
            hep_stack_cfg=hep_stack_cfg,
            )

    obj = Objective(
        function = objective_fn,
        function_config= obj_hep_config
    )
    print(obj)
    x = np.array(obj.space.rvs())
    x= np.array([810.3113227782766, 2329.780075121109,  17.69281474940521,  3421.070390622817, 7313.578069863165, 6990.57913776928,28734324.300159443, 4356075.451915027])
    result = obj.sample(x, is_normalised=False)
    print(result)