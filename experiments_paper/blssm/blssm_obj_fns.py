import numpy as np
from hepaid.search.objective import Objective
from hepaid.hep.stack import hep_stack_fn


from blssm_functions import mu_aa_masses_hbhs_mg5
from blssm_functions import mu_aa_bb_masses_hbhs_mg5
from blssm_functions import mus_masses_hbhs_mg5


def all_pheno_obj_fn(x):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated signal strength modifier to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    sample_dict = hep_stack_fn(
        x,
        hep_config=hep_stack_config,
        close=True
        )
    sample_dict = mus_masses_hbhs_mg5(
        sample_dict, obj_hep_fn
        )
    return sample_dict

def aa_bb_pheno_obj_fn(x):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated signal strength modifier to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    sample_dict = hep_stack_fn(
        x,
        hep_config=hep_stack_config,
        close=True
        )
    sample_dict = mu_aa_bb_masses_hbhs_mg5(
        sample_dict, obj_hep_fn
        )
    return sample_dict

def aa_pheno_obj_fn(x):
    '''
    Use the HEP-Stack function to obtain the output dictionary and add the 
    calculated signal strength modifier to a simple (non-nested) dictionary 
    as required by the Objective class.
    '''
    sample_dict = hep_stack_fn(
        x,
        hep_config=hep_stack_config,
        close=True
        )
    sample_dict = mu_aa_masses_hbhs_mg5(
        sample_dict, obj_hep_fn
        )
    return sample_dict

obj_hep_fn = 'configs/obj_hep_fn.yml'
hep_stack_config = 'configs/hep_stack_config.yaml'
aa_pheno_obj = Objective(
    obj_hep_fn,
    aa_pheno_obj_fn,   
)


if __name__ == '__main__':
    # Test
    print(aa_pheno_obj)
    x = np.array(aa_pheno_obj.space.rvs())
    result = aa_pheno_obj.sample(x, is_normalised=False)
    print(result)