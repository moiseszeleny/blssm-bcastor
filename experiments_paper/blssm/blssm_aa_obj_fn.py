import os
import pandas as pd

from pathlib import Path
from omegaconf import OmegaConf
from functools import partial

from hepaid.hep.data import HEPDataSet

from hepaid.search.objective.objective_fn import ObjectiveFunction
from hepaid.hep.stack import hep_stack_fn
from hepaid.search.objective.utils import load_config
import numpy as np

from blssm_functions import mu_aa_masses_hbhs_mg5,spheno_hbhs

# hep_config = OmegaConf.load(
#     'configs/hep_files/blssm_config_v2.yaml'
#     )
# search_config = OmegaConf.load('configs/aa_search.yaml')
# hyper_params = OmegaConf.load('configs/asp_mu_aa.yaml')
# hep_dataset = HEPDataSet()
# space_config = dict(hep_config.model.input)

obj_hep_fn = load_config('configs_new/obj_hep_fn.yml')

hep_stack_config = load_config('configs_new/hep_stack_config.yaml')

parameters = {
    **obj_hep_fn.input_space,
    **obj_hep_fn.output_parameters
    }

def objective_pheno(x):
    sample_dict = hep_stack_fn(
        x,
        hep_config=hep_stack_config,
        close=True
        )
    print(sample_dict)
    sample_dict = mu_aa_masses_hbhs_mg5(
        sample_dict, obj_hep_fn
        )
    return sample_dict

objective_hep = ObjectiveFunction(
    obj_hep_fn,
    objective_pheno,   
)


if __name__ == '__main__':
    print(objective_hep)

    x = np.array(objective_hep.space.rvs())
    result = objective_hep.sample(x, is_normalised=False)
    print(result)