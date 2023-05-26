% Setup path
addpath(genpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/megconnectome-3.0'));
addpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/fieldtrip-20220707/fieldtrip-20220707');
ft_defaults
addpath(genpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/cifti-matlab'));

save_path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/source_localization_epochs/';

% Create epochs

n_epochs = 33;
mfiles = dir('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/Enrico_MEG_source_localization_test/*.mat');
counter = 1;
epoch_length = 4;
emptyMatrix = zeros(148, 1018*4, 29);

for file = mfiles'
    disp(file);
    load(fullfile(file.folder, file.name));
    disp(size(meg.ts_ROI));
    m = size(meg.ts_ROI);
    disp(m(1));
    if m(1) ~= 148
        continue
    end
    for j = 1:148
        for i = 1:29
            start_epoch = (i-1) * 4 + 1;
            end_epoch = start_epoch + 3;
            epoch = reshape(meg.ts_ROI(j, :, start_epoch:end_epoch), [], 1);
            emptyMatrix(j, :, i) = epoch;
            
        end
        
    end
    save(fullfile(save_path, file.name), 'emptyMatrix');
    
end