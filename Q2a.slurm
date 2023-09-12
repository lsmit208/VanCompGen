#!/bin/bash 

#set a job name  
#SBATCH --job-name=Q2a
#################  
#a file for job output, you can check job progress
#SBATCH --output=Q2a.out
#################
# a file for errors from the job
#SBATCH --error=Q2a.err
################
#time you think you need; default is 2 hours
#format could be dd-hh:mm:ss, hh:mm:ss, mm:ss, or mm
#SBATCH --time=30
#################
#number of nodes you are requesting
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1 
#################
#memory per node; default is 4000 MB per CPU
#SBATCH --mem=1G
#################

# Have SLURM send you an email when the job ends or fails, careful, the email could end up in your clutter folder
# Also, if you submit hundreds of jobs at once you will get hundreds of emails.
 
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=logan.b.smith@vanderbilt.edu

module load GCC Python
module load Pysam
python split_2a.py -b possorted_bam_chr21.bam -o1 1.bam -o2 2.bam -d . -p 0.1
