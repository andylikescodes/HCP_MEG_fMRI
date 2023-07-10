#!/bin/env bash
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8096
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
module load matlab

matlab -nodisplay -nosplash -r "addpath(genpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/scripts/meg_fconn')); single_compute_FC('${filename}')"