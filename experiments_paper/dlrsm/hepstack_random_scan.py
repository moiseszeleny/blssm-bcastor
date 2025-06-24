# Import the HEP-Stack module
from hepaid.hep.stack import HEPSTACK
import numpy as np

# Initialise the HEP-Stack with a configuration file
hep_config = "/home/moises/blssm-bcastor/experiments_paper/dlrsm/hepstack/hepstack_config.yaml"
hepstack = HEPSTACK['SPhenoStack'](hep_config=hep_config)

# script to sample random points in the parameter space
# and save the benchmark points and their corresponding mh1 and mh2 values
# to a dataframe 
import pandas as pd
# Create a DataFrame to store results
results_df = pd.DataFrame(columns=['mh1', 'mh2', 'sample'])
# Append the result if is valid

def append_result_to_df(mh1, mh2, sample):
    global results_df
    if mh1 is not None and mh2 is not None:
        # Use pd.concat instead of deprecated DataFrame.append
        new_row = pd.DataFrame([{'mh1': mh1, 'mh2': mh2, 'sample': sample}])
        results_df = pd.concat([results_df, new_row], ignore_index=True)

# Loop to sample 1000 random points in the parameter space
for i in range(1000):
    # Define a benchmark for sampling
    benchmark_point = [
        np.random.uniform(-4.0, 4.0), # lam1input
        np.random.uniform(-4.0, 4.0), # lam2input
        np.random.uniform(-4.0, 4.0), # lam3input
        np.random.uniform(-4.0, 4.0), # lam4input
        np.random.uniform(-4.0, 4.0), # lam5input
        np.random.uniform(-4.0, 4.0), # lam6input
        np.random.uniform(-4.0, 4.0), # rho1input
        np.random.uniform(-4.0, 4.0), # rho2input
        np.random.uniform(-4.0, 4.0), # alp1input
        np.random.uniform(-4.0, 4.0), # alp2input
        np.random.uniform(-4.0, 4.0)  # alp3input
    ]

    try:
        print(f"Sample {i+1}:")
        result = hepstack.sample(benchmark_point)
        slha = result.get('SLHA') if result else None
        if not slha:
            print("  No SLHA block found in result. Skipping sample.")
            continue
        mass = slha.get('MASS')
        if not (mass and mass.get('entries')):
            print("  No MASS block found in SLHA output. Skipping sample.")
            continue
        mass_entries = mass.get('entries')
        mh1 = mass_entries.get('25', {}).get('value', [None])[0]
        mh2 = mass_entries.get('35', {}).get('value', [None])[0]
        print(f"  mh1: {mh1}, mh2: {mh2}")
        dict_result = {
            'mh1': mh1,
            'mh2': mh2,
            'sample': benchmark_point
        }
        append_result_to_df(mh1, mh2, benchmark_point)
    except Exception as e:
        print(f"  Error during sampling: {e}")
        continue

# Save the results to a CSV file
results_df.to_csv('dlrsm_random_scan_results.csv', index=False)
print("Results saved to 'dlrsm_random_scan_results_mh1mh2.csv'")