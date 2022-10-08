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
#apt-get -y install libqt5core5a
mkdir /tmp/wb_command_test
cp /home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/container/workbench_test2.sif /tmp/wb_command_test/workbench_test2.sif
cd /tmp/wb_command_test
strip --remove-section=.note.ABI-tag /usr/lib/x86_64-linux-gnu/libQt5Core.so.5
apptainer exec --fakeroot workbench_test2.sif wb_command -help
rm -rf /tmp/wb_command_test


