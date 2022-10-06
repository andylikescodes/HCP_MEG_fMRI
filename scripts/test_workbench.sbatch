#!/bin/env bash
#SBATCH --job-name=test_workbench
#SBATCH --output=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/test/test.out
#SBATCH --error=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/test/test.err
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8096
#SBATCH --ntasks=1
#SBATCH --time=12:00:00

module load connectome-wb/1.5.0
wb_command -version
wb_command -help


