#!/bin/bash 
#
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#################
#set a job name  
#SBATCH --job-name=GATKvar
#################  
#a file for job output, you can check job progress
#SBATCH --output=GATKvar.out
#################
# a file for errors from the job
#SBATCH --error=GATKvar.err
################
#time you think you need; default is 2 hours
#format could be dd-hh:mm:ss, hh:mm:ss, mm:ss, or mm
#SBATCH --time=02:00:00
#################
#quality of service; think of it as job priority
# We are submitting to the dev partition, there are several on sherlock: normal, gpu, owners, hns, bigmem (jobs requiring >64Gigs RAM) 
# 
#################
#number of nodes you are requesting
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1 
#################
#memory per node; default is 4000 MB per CPU
#SBATCH --mem=5G
#################

# Have SLURM send you an email when the job ends or fails, careful, the email could end up in your clutter folder
# Also, if you submit hundreds of jobs at once you will get hundreds of emails.
 
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=logan.b.smith@vanderbilt.edu

#now run normal batch commands
module load GCCcore/.8.2.0 GATK/4.1.2.0-Java-1.8.0_192
gatk HaplotypeCaller -R refdata_hg19_chr21/fasta/genome.fa -I possorted_bam_chr21.bam -O GATKcalls.vcf