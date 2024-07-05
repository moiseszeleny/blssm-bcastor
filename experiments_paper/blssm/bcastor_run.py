
from omegaconf import OmegaConf

import itertools
import click

from pathlib import Path
from asp.search.bcastor import bcastor
from asp.search.objective_fn import ObjectiveFunction

from blssm_aa_obj_fn import objective_hep as obj_hep_aa
from blssm_aabb_obj_fn import objective_hep as obj_hep_aabb
from blssm_aabbtautau_obj_fn import objective_hep as obj_hep_aabbtautau

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
@click.option('--channels', type=str, default='aa', help='Fitting aa/aabb/aabbtautau')
def run(n, mode, config, channels):
    search_hyper_parameters = OmegaConf.load(config)
    if mode == 'sweep_decay':
        search_hyper_parameters = sweep_decay(
            search_hyper_parameters,
            n
            )
    
    if channels == 'aa':
        bcastor(
            obj_hep_aa,
            search_hyper_parameters
        )
    if channels == 'aabb':
        bcastor(
            obj_hep_aabb,
            search_hyper_parameters
        )
    if channels == 'aabbtautau':
        bcastor(
            obj_hep_aabbtautau,
            search_hyper_parameters
        )

    
    config_path = Path('datasets')/ search_hyper_parameters.run_name
    OmegaConf.save(config=search_hyper_parameters,
                    f=config_path / 'hprms.yaml')

    

if __name__ == "__main__":
    run()
