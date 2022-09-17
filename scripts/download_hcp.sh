#!/bin/bash

path_to_save="/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data"

path_to_aws="s3://hcp-openaccess/HCP_1200/"

echo "Start copying ${path_to_aws} to ${path_to_save}..."

aws s3 sync $path_to_aws $path_to_save --exclude "*/unprocessed/*"
