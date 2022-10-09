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
    paths = glob('../output/parcellate/{}*'.format(subject_id))
    all_files = []
    for path in paths:
        par = nib.load(path).get_fdata()
        all_files.append(par)
    
    out_data = np.vstack(all_files)
    out_data = out_data[::skip, :]
    
    corr = pd.DataFrame(out_data).corr().dropna(axis=1, how='all').dropna(axis=0, how='all').values
    return out_data, corr

def calculate_average_corr(all_corr):
    tmp = np.zeros(all_corr[0].shape)
    for m in all_corr:
        tmp += m
    avg_m = tmp/len(all_corr)
    return avg_m

def plot_corr(corr, save_name=None):
    plt.figure()
    sns.heatmap(corr, annot=False,center=0, cmap=sns.diverging_palette(220, 10, as_cmap=True))
    if save_name:
        plt.savefig(save_name)
    plt.close()

def get_data(list_of_subjects, skip=100):
    # Using readline()
    all_corr = []
    all_subjects = []
    for subject in list_of_subjects:
        subject_data, corr = load_subject('../output/parcellate/', subject, skip)
        all_subjects.append(subject_data)
        all_corr.append(corr)
    return all_subjects, all_corr
