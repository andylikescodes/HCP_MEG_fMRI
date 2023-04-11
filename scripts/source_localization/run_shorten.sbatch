#!/bin/env bash
#SBATCH --job-name=source_localization3
#SBATCH --output=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/scripts/source_localization/run3.out
#SBATCH --error=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/scripts/source_localization/run3.err
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=32G
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
module load matlab
cd ~/Documents/HCP_MEG_fMRI/external/MEG_fingerprints/MEG_source_recon
matlab -nodisplay -nosplash -r "batch_ResampleParcellation_SourceReconstruction; exit"
