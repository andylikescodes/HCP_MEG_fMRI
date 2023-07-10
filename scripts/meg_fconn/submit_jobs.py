import sys
import os
from glob import glob

def create_directory(directory):
    try:
        if not os.path.exists(directory):
            os.makedirs(directory)
    except OSError:
        print(f"Error: Creating directory. {directory}")

base_path = "/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output"
data_path = os.path.join(base_path, 'source_localization_epochs')
output_path = os.path.join(base_path, 'FC_cluster_full')

filepaths = glob(os.path.join(data_path, '*.mat'))

for filepath in filepaths:

    filename = os.path.basename(filepath)
    
    print(filename)

    this_output_path = os.path.join(output_path, filename)

    create_directory(this_output_path)

    out_path = "--output={}/log.out ".format(this_output_path)
    err_path = "--error={}/log.err ".format(this_output_path)
    job_name = "--job-name={} ".format(filename)
    parameters = "--export=filename={} ".format(filename)

    command = "sbatch " + out_path + err_path + job_name + parameters + 'job.sbatch'

    os.system(command=command)