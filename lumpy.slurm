#!/bin/bash 
#
#all commands that start with SBATCH contain commands that are just used by SLURM for scheduling
#################
#set a job name  
#SBATCH --job-name=lumpy
#################  
#a file for job output, you can check job progress
#SBATCH --output=lumpy.out
#################
# a file for errors from the job
#SBATCH --error=lumpy.err
################
#time you think you need; default is 2 hours
#format could be dd-hh:mm:ss, hh:mm:ss, mm:ss, or mm
#SBATCH --time=01:00:00
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
#SBATCH --mem=16G
#################

# Have SLURM send you an email when the job ends or fails, careful, the email could end up in your clutter folder
# Also, if you submit hundreds of jobs at once you will get hundreds of emails.
 
#SBATCH --mail-type=END,FAIL # notifications for job done & fail
#SBATCH --mail-user=logan.b.smith@vanderbilt.edu

#now run normal batch commands
module load GCC/6.4.0-2.28 OpenMPI/2.1.1 LUMPY/0.3.0
lumpy -mw 4 -tt 0 -pe id:possorted_realigned_rmdup,bam_file:possorted_realigned_rmdup.discordants.bam,histo_file:possorted_realigned_rmdup.lib1.histo,mean:327,stdev:115,read_length:101,min_non_overlap:101,discordant_z:5,back_distance:10,weight:1,min_mapping_threshold:20 -sr id:possorted_realigned_rmdup,bam_file:possorted_realigned_rmdup.splitters.bam,back_distance:10,weight:1,min_mapping_threshold:20 > lumpycalls.vcf