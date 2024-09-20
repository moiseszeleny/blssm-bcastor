
from omegaconf import OmegaConf

import itertools
import click

from pathlib import Path
from hepaid.search.method import bCASTOR
from hepaid.search.objective import Objective

from blssm_obj_fns import aa_pheno_obj_fn
from blssm_obj_fns import aa_bb_pheno_obj_fn
from blssm_obj_fns import all_pheno_obj_fn

hep_stack_config = 'configs/hep_stack_config.yaml'

def sweep(config, n):
    tpe_trials = [100, 300, 500]
    alpha = [1,2]
    r = [0.2, 0.02, 0.002]
    combinations = list(itertools.product(tpe_trials, alpha, r))

    config.batch_sampling.tpe_trials = combinations[n][0]
    config.batch_sampling.alpha = combinations[n][1]
    config.resolution.constant_resolution = True
    config.resolution.value = combinations[n][2]
    config.run_name = f'hb_bcastor_local/run_{n}'

    return config

def sweep_decay(config, n):
    tpe_trials = [500, 1000, 1500, 2000, 2500]
    r = [(0.02,0.002), (0.002,0.0002), (0.0002, 0.00002), (0.02,0.000002)]
    combinations = list(itertools.product(tpe_trials, r))

    config.batch_sampling.tpe_trials = combinations[n][0]
    config.resolution.constant_resolution = False
    config.resolution.initial = combinations[n][1][0]
    config.resolution.final = combinations[n][1][1]
    config.run_name = f'blssm_sweep/run_{n}'

    return config

@click.command()
@click.option('--n', type=int, default=0, help='Combination number')
@click.option('--mode', type=str, default='single_run', help='single_run/sweep_decay')
@click.option('--config', type=str, default='configs/asp_mu_aa.yaml', help='Path to the config file')
@click.option('--channels', type=str, default='aa', help='Fitting aa/aabb/all')
def run(n, mode, config, channels):
    search_hyper_parameters = OmegaConf.load(config)
    if mode == 'sweep_decay':
        search_hyper_parameters = sweep_decay(
            search_hyper_parameters,
            n
            )
    
    if channels == 'aa':
        obj_hep_config= 'configs/aa_obj_hep.yml'
        aa_pheno_obj = Objective(
            function_config=obj_hep_config,
            function=aa_pheno_obj_fn,   
        )
        bcastor = bCASTOR(
            objective_function=aa_pheno_obj,
            hyper_parameters=search_hyper_parameters
        )
        bcastor.run()
    if channels == 'aabb':
        obj_hep_config = 'configs/aa_bb_obj_hep.yml'
        aa_bb_pheno_obj = Objective(
            function_config=obj_hep_config,
            function=aa_bb_pheno_obj_fn,   
        )
        bcastor = bCASTOR(
            objective_function=aa_bb_pheno_obj,
            hyper_parameters=search_hyper_parameters
        )
        bcastor.run()
    if channels == 'all':
        obj_hep_config = 'configs/aa_bb_tautau_obj_hep.yml'
        all_pheno_obj = Objective(
            function_config=obj_hep_config,
            function=all_pheno_obj_fn,   
        )
        bcastor = bCASTOR(
            objective_function=all_pheno_obj,
            hyper_parameters=search_hyper_parameters
        )
        bcastor.run()

    
    config_path = Path('datasets')/ search_hyper_parameters.run_name
    OmegaConf.save(config=search_hyper_parameters,
                    f=config_path / 'hprms.yaml')

    

if __name__ == "__main__":
    run()
