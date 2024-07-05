#!/bin/bash 
#SBATCH --job-name=aspblssm0
#SBATCH --time=24:00:00
#SBATCH --tasks=1
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=40

module load gcc/12.1.0
module load cmake
source activate newhep


# Check if the required argument is provided
if [ -z "$1" ]; then
 echo "Usage: $0 <VARIABLE>"
 exit 1
fi

# Assign the provided argument to the VARIABLE variable
VARIABLE="$1"
# Print the value of the VARIABLE
echo "VARIABLE is set to: $VARIABLE"

python /scratch/mjad1g20/active-search-pheno/experiments_paper/blssm/bcastor_run.py --n "$VARIABLE"



