#!/bin/bash 
#
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#################
#set a job name  
#SBATCH --job-name=mantacalls
#################  
#a file for job output, you can check job progress
#SBATCH --output=mantacalls.out
#################
# a file for errors from the job
#SBATCH --error=mantacalls.err
################
#time you think you need; default is 2 hours
#format could be dd-hh:mm:ss, hh:mm:ss, mm:ss, or mm
#SBATCH --time=03:00:00
#################
#quality of service; think of it as job priority
# We are submitting to the dev partition, there are several on sherlock: normal, gpu, owners, hns, bigmem (jobs requiring >64Gigs RAM) 
# 
#################
#number of nodes you are requesting
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1 
#SBATCH --cpus-per-task=8 # 8 threads per task 
#################
#memory per node; default is 4000 MB per CPU
#SBATCH --mem=16G
#################

# Have SLURM send you an email when the job ends or fails, careful, the email could end up in your clutter folder
# Also, if you submit hundreds of jobs at once you will get hundreds of emails.
 
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=logan.b.smith@vanderbilt.edu

#now run normal batch commands
module load GCC/5.4.0-2.26 Python/2.7.12
python runWorkflow.py -j 8 -g 16
