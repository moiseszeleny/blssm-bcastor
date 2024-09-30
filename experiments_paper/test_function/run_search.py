from omegaconf import OmegaConf

import itertools
import click

from pathlib import Path
from hepaid.search.method import bCASTOR, MCMCMH
from hepaid.search.objective import Objective

from hepaid.search.objective.test import init_him_boo_fn, init_egg_box_fn


def sweep(config, n, mode='sweep'):
    """
    General sweep function handling both constant resolution and decay sweeps.
    
    Args:
        config: The configuration object to modify.
        n: The combination index to select from the parameter sweep space.
        mode: Sweep mode, either 'sweep' for constant resolution or 'sweep_decay' for decaying resolution.
    
    Returns:
        Updated configuration object.
    """
    if mode == 'sweep':
        tpe_trials = [100, 300, 500]
        alpha = [1, 2]
        r = [0.2, 0.02, 0.002]
        combinations = list(itertools.product(tpe_trials, alpha, r))
        
        if n >= len(combinations):
            raise ValueError(f"Invalid combination index {n}. Max is {len(combinations) - 1}.")

        config.batch_sampling.tpe_trials = combinations[n][0]
        config.batch_sampling.alpha = combinations[n][1]
        config.resolution.constant_resolution = True
        config.resolution.value = combinations[n][2]

        config.run_name = f'hb_bcastor_local/run_{n}'

    elif mode == 'sweep_decay':
        tpe_trials = [100, 300, 500]
        r = [(0.2,0.02), (0.02,0.002), (0.02, 0.0002)]
        combinations = list(itertools.product(tpe_trials, r))

        if n >= len(combinations):
            raise ValueError(f"Invalid combination index {n}. Max is {len(combinations) - 1}.")

        config.batch_sampling.tpe_trials = combinations[n][0]
        config.resolution.constant_resolution = False
        config.resolution.initial = combinations[n][1][0]
        config.resolution.final = combinations[n][1][1]

        config.run_name = f'blssm_sweep/run_{n}'

    else:
        raise ValueError(f"Unknown sweep mode: {mode}")

    return config

@click.command()
@click.option('--method', type=str, default='bcastor', help='Search method: bcastor/mcmc')
@click.option('--n', type=int, default=0, help='Combination number')
@click.option('--mode', type=str, default='single_run', help='single_run/sweep_decay')
@click.option('--config', type=str, default='configs/bcastor_hyper_params.yaml', help='Path to the config file')
@click.option('--channels', type=str, default='aa', help='Fitting himboo/eggs')
@click.option('--name', type=str, default='', help='New name to edit the config')
def run(method, n, mode, config, channels,name):
    search_hyper_parameters = OmegaConf.load(config)
    if method == 'bcastor':
        if mode in ['sweep', 'sweep_decay']:
            search_hyper_parameters = sweep(search_hyper_parameters, n, mode)
    if name != '':
        search_hyper_parameters.run_name = search_hyper_parameters.run_name + name
    
    cas = True if method == 'bcastor' else False
    # Set the objective based on the selected channel
    if channels == 'himboo':
        objective = init_him_boo_fn(cas=cas)
    elif channels == 'eggs':
        objective = init_egg_box_fn(cas=cas)
    else:
        raise ValueError(f"Unknown channel type: {channels}")

    # Initialize objective and method
    if method == 'bcastor':
        search_method= bCASTOR(
            objective_function=objective,
            hyper_parameters=search_hyper_parameters
        )
    elif method == 'mcmc':
        search_method = MCMCMH(
            objective_function=objective,
            hyper_parameters=search_hyper_parameters
        )
    else:
        raise ValueError("Unknown method type: {method} Please select --method bcastor/mcmc")


    

    # Save the configuration to the specified run path
    config_path = Path('datasets') / search_hyper_parameters.run_name
    config_path.mkdir(parents=True, exist_ok=True)  # Ensure directories are created
    OmegaConf.save(config=search_hyper_parameters, f=config_path / 'hprms.yaml')

    search_method.run()
if __name__ == "__main__":
    run()
