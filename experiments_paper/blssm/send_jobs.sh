#!/bin/bash

# Define the range of n values
start_n=0  # Starting value for n
end_n=10   # Ending value for n (exclusive)

# Define the other parameters
mode="sweep"                   # Set mode: 'single_run', 'sweep', or 'sweep_decay'
config="configs/asp_mu_aa.yaml" # Path to the config file
channels="aa"                  # Channels: 'aa', 'aabb', or 'all'

# Loop over the range of n values and submit a job for each value
for ((n=$start_n; n<$end_n; n++)); do
    echo "Submitting job for n=$n"
    sbatch sbatch.sh "$n" "$mode" "$config" "$channels"
done

echo "All jobs submitted."