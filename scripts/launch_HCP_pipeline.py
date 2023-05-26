# coding: utf-8
import sys
sys.path.insert(0, '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI')
# # Load libraries & helper functions
from src.HCP_helpers import *

# # Set parameters

# config is a global variable used by several functions
# Where does the data live?
config.DATADIR = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data'
config.sourceDir = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI'
# where all output of processing will be, in BIDS like format
config.outDir             = op.join(config.DATADIR,'Results', 'rsDenoise')
#config.outDir             = op.join('rsDenoise')

# Which resting-state denoising pipeline should be used?
config.pipelineName            = 'A'
config.Operations              = config.operationDict[config.pipelineName]
config.interpolation           = 'linear' # or 'linear' or 'astropy'

# Other options
config.isCifti = True
config.queue = False
# if config.isCifti:
#     config.sgeopts = '-l h_vmem=12G -q long.q'
# else:
#     config.sgeopts = '-l h_vmem=25G -q long.q'
config.overwrite = False
config.movementRelativeRMSFile = 'Movement_RelativeRMS.txt'
config.movementRegressorsFile  = 'Movement_Regressors_dt.txt'
# config.behavFile = pd.read_csv('/data/pgaldi/data/unrestricted_paolagaldi_11_2_2017_8_3_2.csv')
# config.RbehavFile = pd.read_csv('/data/pgaldi/data/RESTRICTED_paolagaldi_8_10_2017_16_31_0.csv')

# parcellation for FC matrix
#config.nParcels = 445 #Schaefer_Aseg_SUIT
#config.nParcels = 400 #Schaefer_Aseg_SUIT only cortex
#config.nParcels = 268 #Shen
#config.nParcels = 360 #Glasser

config.nParcels = 148

if config.isCifti:
    config.parcellationName = 'Destrieux'
    config.parcellationFile = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/#subjectID#/MNINonLinear/fsaverage_LR32k/#subjectID#.aparc.a2009s.32k_fs_LR.dlabel.nii'
    #config.parcellationName = 'Schaefer600_Aseg_SUIT_surf'
    #config.parcellationFile = '/data/pgaldi/Schaefer600_Aseg_Suit/Parcels.dlabel.nii'
    #config.parcellationName = 'Glasser'
    #config.parcellationFile = '/data/pgaldi/Glasser/Parcels.dlabel.nii'
else:
    config.parcellationName = 'Destrieux'
    config.parcellationFile = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/100307/MNINonLinear/aparc.a2009s+aseg.nii.gz'
    # config.parcellationName = 'Schaefer_Aseg_SUIT_vol'
    # config.parcellationFile = '/data/pgaldi/Schaefer_Aseg_SUIT/schaefer_aseg_suit.nii.gz'
    #config.parcellationName = 'Shen'
    #config.parcellationFile = '/data/jdubois/data/parcellations/shenetal_neuroimage2013_new/shen_2mm_268_parcellation.nii.gz'
# where all the time series used to compute FC and final FC matrices will be stored
if config.isCifti:
    config.FCDir = op.join(config.DATADIR, 'Results', 'rsDenoise', 'denoise_'+config.pipelineName, config.parcellationName+'_FC')
else:
    config.FCDir = op.join(config.DATADIR, 'Results', 'rsDenoise', 'denoise_'+config.pipelineName, config.parcellationName+'_FC')
#config.FCDir = 'FC_Glasser'


# if working with volumetric data: should the parcels be restricted to the gray matter mask?
if not config.isCifti:
    config.maskParcelswithGM       = False
    if config.maskParcelswithGM:
        config.parcellationName = config.parcellationName + '_GM'

# Define input
fmriRuns = ['rfMRI_REST1_LR','rfMRI_REST1_RL','rfMRI_REST2_LR','rfMRI_REST2_RL']

# ### MRI processing
for config.subject in ['100307']:
#for config.subject in subjects:
    config.parcellationFile = config.parcellationFile.replace('#subjectID#', config.subject)
    for config.fmriRun in fmriRuns:
        runPipelinePar(do_makeGrayPlot=True, do_plotFC=True, overwriteFC=False)
    config.parcellationFile = config.parcellationFile.replace(config.subject, '#subjectID#') 

                
# if len(config.scriptlist)>0:
#     # launch array job
#     #prepareJobArrayFromJobList()
#     fnSubmitJobArrayFromJobList()
#     #config.joblist.append(JobID.split(b'.')[0])

# #checkProgress(pause=60,verbose=False)

