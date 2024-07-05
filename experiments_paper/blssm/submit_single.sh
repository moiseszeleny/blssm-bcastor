#!/bin/bash 
#SBATCH --job-name=abtau
#SBATCH --time=40:00:00
#SBATCH --tasks=1
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=40

module load gcc/12.1.0
module load cmake
source activate newhep




#python /scratch/mjad1g20/active-search-pheno/experiments_paper/blssm/bcastor_run_aabb.py 
python /scratch/mjad1g20/active-search-pheno/experiments_paper/blssm/bcastor_run_aabbtautau.py 



