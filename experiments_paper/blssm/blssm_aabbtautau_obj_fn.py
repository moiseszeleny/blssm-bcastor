import os
import pandas as pd

from pathlib import Path
from omegaconf import OmegaConf
from functools import partial

from hepaid.data import HEPDataSet

from asp.search.objective_fn import ObjectiveFunction
from asp.parallel.modules import generate_initial_dataset
from asp.pheno.objective import hep_stack_fn

from asp.pheno.blssm_functions import mus_masses_hbhs_mg5


from asp.search.bcastor import bcastor
from asp.search.objective_fn import ObjectiveFunction

hep_config = OmegaConf.load(
    'configs/hep_files/blssm_config_v2.yaml'
    )
search_config = OmegaConf.load('configs/hep_mu_aabbtautau.yaml')
hep_dataset = HEPDataSet()
parameters = {
    **search_config.input_parameters,
    **search_config.output_parameters
    }
space_config = dict(hep_config.model.input)

stack = partial(hep_stack_fn,
    hep_config=hep_config,
    hep_dataset=hep_dataset,
    close=True,
    mg5_script=search_config.mg5_script
    )


def function_spheno(x):
    sample_dict = stack(x)
    sample_dict = mus_masses_hbhs_mg5(
        sample_dict, parameters
        )
    return sample_dict

objective_hep = ObjectiveFunction(
    function_spheno,
    dict(hep_config.model.input),
    list(search_config.input_parameters.keys()),
    parameters,
    search_config.objectives
)


if __name__ == '__main__':
    pass