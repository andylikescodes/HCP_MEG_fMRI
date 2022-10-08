#!/bin/env bash
#SBATCH --job-name=parcellate
#SBATCH --output=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/parcellate/parcellate.out
#SBATCH --error=/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/parcellate/parcellate.err
#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8096
#SBATCH --ntasks=1
#SBATCH --time=12:00:00

module load connectome-wb/1.5.0

list_of_files='/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/scripts/n_files.txt'

while ISF= read -r line
do
    parcellation_path="/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/${line}/MNINonLinear/fsaverage_LR32k/${line}.aparc.32k_fs_LR.dlabel.nii"

    runs=("rfMRI_REST1_LR" "rfMRI_REST1_RL" "rfMRI_REST2_LR" "rfMRI_REST2_RL")

    for run in ${runs[@]}; do
        data_path="/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/${line}/MNINonLinear/Results/${run}/${run}_Atlas_MSMAll_hp2000_clean.dtseries.nii"    
        output_path="/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/parcellate/${line}_${run}.ptseries.nii"
        
        wb_command -cifti-parcellate "$data_path" "$parcellation_path" COLUMN "$output_path"
        
    done
done < "$list_of_files"

