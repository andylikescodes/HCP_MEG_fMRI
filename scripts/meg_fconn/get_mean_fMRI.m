path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/Results/rsDenoise/denoise_A';  % Replace with your directory path
save_path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/aggregate_results';
all_subfolders = dir(path);

% dir also returns '.' and '..', we need to remove them
all_subfolders = all_subfolders([all_subfolders.isdir] & ...
                                    ~strcmp({all_subfolders.name},'.') & ...
                                    ~strcmp({all_subfolders.name},'..'));

for i = 1:length(all_subfolders)
    
end


