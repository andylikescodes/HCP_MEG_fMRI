#!/bin/bash

# This bash script is used in windowns machine

input='./n_files_subset.txt'
while IFS= read -r line
do
    # Make the directories for the data
    subjectid="$line"
    path_to_save="/mnt/d/HCP_MEG_fMRI/data/${subjectid}"
    echo "Creating folder ${path_to_save}..."
    mkdir -p $path_to_save

    # echo $path_to_save

    # Set up the aws path
    path_to_aws="s3://hcp-openaccess/HCP_1200/${subjectid}"
    # echo $path_to_aws
    echo "Start copying ${path_to_aws} to ${path_to_save}..."
    aws s3 sync $path_to_aws $path_to_save --exclude "*/unprocessed/*" --exclude "*/Pnoise/*" --exclude "*/Rnoise/*" --exclude "*/StoryM/*" --exclude "*/Wrkmem/*"
    echo "Done!"
done < $input
