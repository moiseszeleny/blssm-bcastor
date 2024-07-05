import numpy as np
from torch.quasirandom import SobolEngine
from asp.search.objective_fn import ObjectiveFunction
from asp.search.mcmc import smooth_box_mask, smooth_mask
from asp.search.mcmc import proposal_distribution, metropolis_hastings
from asp.search.mcmc import recursive_proposal
from pathlib import Path
from functools import partial
#from phebo.pheno.objective import hep_stack_fn
from asp.pheno.objective import hep_stack_fn
from omegaconf import OmegaConf
from hepaid.data import HEPDataSet
from asp.pheno.blssm_functions import mu_aa_masses_hbhs_mg5,spheno_hbhs
import pandas as pd
import argparse
import time
from scipy.stats import loguniform

from asp.pheno.utils import id_generator
import click

from blssm_aabb_obj_fn import objective_hep
import ray

ray.init()


@ray.remote
def run(n_value):
    objective_function = objective_hep

    def likelihood(x, objective_function):
        result = objective_function.sample(
           x.reshape(1,-1), is_normalised=True
        )
        if any(value is None for value in result.values()):
            return None
        else:
            mh1 = float(result['Mh(1)'])
            mh2 = float(result['Mh(2)'])
            csq = float(result['csq(tot)'])
            obsratio = float(result['obsratio'])
            mu_aa = float(result['mu_aa'])
            mu_bb = float(result['mu_bb'])

            l_mh1 = smooth_box_mask(mh1, 95.4 - 5., 95.4 + 5.) 
            l_mh2 = smooth_box_mask(mh2, 125. -5., 125 + 5.) 
            l_obsratio = 1 - smooth_mask(obsratio,1.)
            l_csq = 1 - smooth_mask(csq,  136.6)
            l_mu_aa = smooth_box_mask(mu_aa, 0.18, 0.37)
            l_mu_bb = smooth_box_mask(mu_bb, 0.06, 0.174)

            lh =  l_mh1*l_mh2*l_obsratio*l_csq*l_mu_aa*l_mu_bb
            return lh

    def prop_dist(x):
        '''Proposal distribution construction'''
        #step_size = np.random.uniform(1e-6,1e-4)
        step_size = loguniform.rvs(1e-6, 1e-4)
        #return np.clip(proposal_distribution(x,step_size), 0,1)
        return recursive_proposal(x, step_size)
    
    # HEPStack might return None initial likelihood so search for an initial 
    # random state away from the boundaries
    initial_likelihoood = None

    num_samples = 30
    iterations = 30
    burnin = 0.0

    #time_per_call = [] 
    for _ in range(iterations):
        while initial_likelihoood == None:
            initial_state = np.random.uniform(0.1,0.9,size=8)
            ti = time.time()
            initial_likelihoood = likelihood(initial_state, objective_function)
            tf = time.time()
           #time_per_call.append(tf - ti)

        samples, total_prop_history,_,  success_history = metropolis_hastings(
            partial(likelihood, objective_function=objective_function),
            proposal_distribution,
            initial_state,
            initial_likelihoood,
            initial_scale=np.random.uniform(0.4,0.8),
            num_samples=500,
            adapt_frequency=10,
            burn_in=300
            )


        # Create dataframes and save
        #time_df = pd.DataFrame({'time_per_call': time_per_call})
        df = objective_function.as_dataframe(satisfactory=False).astype(float)
        filepath = Path(f'mcmc_bb_blssm_runs_ray_1/run_chckpnt_{n_value}.csv')  
        filepath.parent.mkdir(parents=True, exist_ok=True)  
        df.to_csv(filepath, index=False)  
        #time_df.to_csv(filepath.parent / f'times_{n_value}.csv')
        
        # Define next state as the contiunation of the last chain
        # Evaluate likelihood (again)
        initial_state = objective_function.X[-1]
        ti = time.time()
        initial_likelihoood = likelihood(initial_state, objective_function)
        tf = time.time()
        #time_per_call.append(tf - ti)

    return True


@click.command()
@click.argument('num', type=int)
def main(num):
    # Randomly generate sets of hyperparameters and launch a task to evaluate it.
    num_of_chains = num
    # A list holding the object refs for all of the experiments that we have
    # launched but have not yet been processed.
    remaining_ids = []
    # A dictionary mapping an experiment's object ref to its hyperparameters.
    # hyerparameters used for that experiment.
    run_mapping = {}    
    for i in range(num_of_chains):
        generated_id = id_generator(5)
        run_id = run.remote(generated_id)
        remaining_ids.append(run_id)
        run_mapping[run_id] = generated_id


        
    # Fetch and print the results of the tasks in the order that they complete.
    while remaining_ids:
        # Use ray.wait to get the object ref of the first task that completes.
        done_ids, remaining_ids = ray.wait(remaining_ids)
        # There is only one return result by default.
        result_id = done_ids[0]
        generated_id = run_mapping[result_id]

        result = ray.get(result_id)
        print('{}: {}'.format(generated_id, result))

if __name__ == "__main__":
    main()
    


