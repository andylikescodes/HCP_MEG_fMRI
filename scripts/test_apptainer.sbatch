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

module load apptainer
apt-get -y install libqt5core5a
mkdir /tmp/wb_command_test
cp /home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/container/workbench_test.sif /tmp/wb_command_test/workbench_test.sif
cd /tmp/wb_command_test
apptainer exec --fakeroot workbench_test.sif wb_command -help
rm -rf /tmp/wb_command_test


