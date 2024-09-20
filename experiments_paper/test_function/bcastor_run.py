
from omegaconf import OmegaConf

from hb_function import input_parameters, output_parameters
from hb_function import objectives, space_config
from hb_function import himmelblau_booth
import itertools
import click

from pathlib import Path
from asp.search.bcastor import bcastor
from asp.search.objective_fn import Objective

def sweep(config, n):
    tpe_trials = [100, 300, 500]
    alpha = [1,2]
    r = [0.2, 0.02, 0.002]
    combinations = list(itertools.product(tpe_trials, alpha, r))

    config.batch_sampling.tpe_trials = combinations[n][0]
    config.batch_sampling.alpha = combinations[n][1]
    config.resolution.constant_resolution = True
    config.resolution.value = combinations[n][2]
    config.run_name = f'hb_bcastor_local/run_rc_{n}'

    return config

def sweep_decay(config, m):
    n=17
    tpe_trials = [100, 300, 500]
    alpha = [1,2]
    r = [(0.2,0.02), (0.02,0.002), (0.02, 0.0002)]
    combinations = list(itertools.product(tpe_trials, alpha, r))

    config.batch_sampling.tpe_trials = combinations[n][0]
    config.batch_sampling.alpha = combinations[n][1]
    config.resolution.constant_resolution = False
    config.resolution.initial = combinations[n][2][0]
    config.resolution.final = combinations[n][2][1]
    config.run_name = f'hb_bcastor_local/run_rdecay_long_{n}_{m}'

    return config


@click.command()
@click.option('--n', type=int, help='Combination number')
def run(n):
    search_hyper_parameters = OmegaConf.load('configs/bcastor_hyper_params.yaml')
    search_hyper_parameters = sweep_decay(
        search_hyper_parameters,
        n
        )
    
    objective_function = Objective(
            himmelblau_booth,
            space_config,
            input_parameters,
            output_parameters,
            objectives
            )

    bcastor(
        objective_function,
        search_hyper_parameters
    )
    
    config_path = Path('datasets')/ search_hyper_parameters.run_name
    OmegaConf.save(config=search_hyper_parameters,
                    f=config_path / 'hprms.yaml')


if __name__ == "__main__":
    run()
