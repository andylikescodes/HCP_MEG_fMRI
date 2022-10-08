#!/bin/env bash
#SBATCH --job-name=100307_MEG_3-Restin_rmegpreproc.mat
#SBATCH --output=/home/deliang@chapman.edu/Documents/causal_HCP/sbatch/test_run_30_45/100307/100307_MEG_3-Restin_rmegpreproc.mat.out
#SBATCH --error=/home/deliang@chapman.edu/Documents/causal_HCP/sbatch/test_run_30_45/100307/100307_MEG_3-Restin_rmegpreproc.mat.err
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8096
#SBATCH --ntasks=1
#SBATCH --time=12:00:00

module load matlab
matlab -nodisplay -nosplash -r "addpath(genpath('/home/deliang@chapman.edu/Documents/causal_HCP/pipeline_files/')); cmeg_eloreta_mom('100307', 'test_run_30_45', '100307_MEG_3-Restin_rmegpreproc.mat', '30', '45')"
