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

print(data_path)

filenames = glob(os.path.join(data_path, '*.mat'))

print(filenames)

filename = os.path.basename(filenames[5])

output_path = os.path.join(output_path, filename)

create_directory(output_path)

out_path = "--output={}/log.out ".format(output_path)
err_path = "--error={}/log.err ".format(output_path)
job_name = "--job-name={} ".format(filename)
parameters = "--export=filename={} ".format(filename)

command = "sbatch " + out_path + err_path + job_name + parameters + 'job.sbatch'

print(command)

os.system(command=command)