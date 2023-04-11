import numpy as np
import pandas as pd
import seaborn as sns
from glob import glob
import matplotlib.pyplot as plt

import nibabel as nib

def test():
    print('hello world')
    
def get_list_of_subjects(file):
    # Using readline()
    file1 = open(file, 'r')
    subject_list = []
    while True:

        # Get next line from file
        line = file1.readline().strip()

        # if line is empty
        # end of file is reached
        if not line:
            break
        subject_list.append(line)
    file1.close()
    return subject_list
    
def load_subject(path_to_data, subject_id, skip=50):
    '''
    Load all four runs of subjects into a single file, and perform skipping to remove auto
    correlation.
    '''
    paths = glob(path_to_data+subject_id+'*')
    data = []
    for path in paths:
        par = nib.load(path)
        par_dat = par.get_fdata()
        data.append(par_dat)

    data = np.vstack(data).T
    # remove rows having all zeroes
    data = data[~np.all(data == 0, axis=1)]
    resample = data[:, ::50]
    df = pd.DataFrame(data.T)
    
    corr = df.corr()
    plot_corr(corr, close=False)
    return data.T, corr

def calculate_average_corr(all_corr):
    tmp = np.zeros(all_corr[0].shape)
    for m in all_corr:
        tmp += m
    avg_m = tmp/len(all_corr)
    return avg_m

def plot_corr(corr, save_name=None, close=True, zero_diag=False):
    if zero_diag==True:
        np.fill_diagonal(corr, 0)
    plt.figure()
    sns.heatmap(corr, annot=False,center=0, cmap=sns.diverging_palette(220, 10, as_cmap=True))
    if save_name:
        plt.savefig(save_name)
    if close==True:
        plt.close()

def get_subject_data(list_of_subjects, data_path, skip=100):
    # Using readline()
    all_corr = []
    all_subjects = []
    all_sessions = []
    for subject in list_of_subjects:
        subject_data, corr = load_subject(data_path, subject, skip)
        all_subjects.append(subject_data)
        all_corr.append(corr)
    return all_subjects, all_corr

