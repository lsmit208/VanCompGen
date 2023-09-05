#!/bin/bash 

# job name  
#SBATCH --job-name=Q1_job
# job output
#SBATCH --output=Q1_job.out
# errors
#SBATCH --error=Q1_job.err
#time needed (hh:mm)
#SBATCH --time=02:00:00
#number of nodes you are requesting
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1 
# memory per node
#SBATCH --mem=5G
# set up email
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=logan.b.smith@vanderbilt.edu

# task requested
module load Anaconda3
python vector.py
