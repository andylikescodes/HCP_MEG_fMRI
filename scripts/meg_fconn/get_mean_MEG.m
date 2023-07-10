path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/FC_cluster_full';  % Replace with your directory path
save_path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/aggregate_results';
all_subfolders = dir(path);

% dir also returns '.' and '..', we need to remove them
all_subfolders = all_subfolders([all_subfolders.isdir] & ...
                                    ~strcmp({all_subfolders.name},'.') & ...
                                    ~strcmp({all_subfolders.name},'..'));

c = struct;
c(1).frequency_bands = "delta_2-4_Hz";
c(1).range = [2,4];
c(2).frequency_bands = "theta_5-7_Hz";
c(2).range = [5,7];
c(3).frequency_bands = "alpha_8-12_Hz";
c(3).range = [8,12];
c(4).frequency_bands = "beta_15-29_Hz";
c(4).range = [15,29];
c(5).frequency_bands = "gamma1_30-59_Hz";
c(5).range = [30,59];
c(6).frequency_bands = "gamma2_60-90_Hz";
c(6).range = [60,90];


for i = 1:length(c)
    [AEC, AECc, PLI, PLM, PLV, wPLI] = get_single_session_mean_FC(all_subfolders, c(i).frequency_bands);

    save(fullfile(save_path, c(i).frequency_bands + "_AEC.mat"), "AEC");
    save(fullfile(save_path, c(i).frequency_bands + "_AECc.mat"), "AECc");
    save(fullfile(save_path, c(i).frequency_bands + "_PLI.mat"), "PLI");
    save(fullfile(save_path, c(i).frequency_bands + "_PLM.mat"), "PLM");
    save(fullfile(save_path, c(i).frequency_bands + "_PLV.mat"), "PLV");
    save(fullfile(save_path, c(i).frequency_bands + "_wPLI.mat"), "wPLI");

end


