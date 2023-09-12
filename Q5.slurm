#!/bin/bash 
#
#################
#set a job name  
#SBATCH --job-name=Q5
#################  
#a file for job output
#SBATCH --output=Q5.out
#################
# a file for errors from the job
#SBATCH --error=Q5.err
################
#format could be dd-hh:mm:ss, hh:mm:ss, mm:ss, or mm
#SBATCH --time=30
#################
#number of nodes you are requesting
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1 
#################
#SBATCH --mem=2G
#################

# Have SLURM send you an email when the job ends or fails, careful, the email could end up in your clutter folder
# Also, if you submit hundreds of jobs at once you will get hundreds of emails.
 
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=logan.b.smith@vanderbilt.edu

module restore q3
bash run_bwa.sh