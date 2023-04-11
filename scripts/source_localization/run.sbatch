#!/bin/env bash
#SBATCH --job-name=source_localization
#SBATCH --output=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/scripts/source_localization/run.out
#SBATCH --error=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/scripts/source_localization/run.err
#SBATCH --partition=cpu-long.q
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --ntasks=1
#SBATCH --time=3-00:00:00
module load matlab
matlab -nodisplay -nosplash -r "~/Documents/HCP_MEG_fMRI/external/MEG_fingerprints/MEG_source_recon/batch_ResampleParcellation_SourceReconstruction; exit"
