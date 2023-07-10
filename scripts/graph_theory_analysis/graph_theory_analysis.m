% connectivity path for fMRI
path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/data/Results/rsDenoise/denoise_A';  % Replace with your directory path
save_path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/aggregate_results';
all_subfolders = dir(path);

% dir also returns '.' and '..', we need to remove them
all_subfolders = all_subfolders([all_subfolders.isdir] & ...
                                    ~strcmp({all_subfolders.name},'.') & ...
                                    ~strcmp({all_subfolders.name},'..'));


subject_struct = {};                            
                                    
for i = 1:length(all_subfolders)
    if ~isnan(str2double(all_subfolders(i).name))
        subject_path = fullfile(path, all_subfolders(i).name, '*/*/*/allParcels_*_Pearson.txt');
        file_paths = dir(subject_path);
        tmp_m = zeros(148,148);
        for j = 1:length(file_paths)
            m = load(fullfile(file_paths(j).folder, file_paths(j).name));
            tmp_m = tmp_m + m;
        end
        avg_m = tmp_m ./ length(file_paths);
        subject_struct(i).subject_id = all_subfolders(i).name;
        subject_struct(i).conn_fmri = avg_m;
    end
    
end

meg_path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/FC_cluster_full/'

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


for i = 1:length(all_subfolders)
    if ~isnan(str2double(all_subfolders(i).name))
        for j = 1:length(c)
            % mean_AEC
            path_to_matrix = fullfile(meg_path, [all_subfolders(i).name '_*'], c(j).frequency_bands, 'mean_AEC.mat');
            subject_folder = dir(path_to_matrix);
            tmp_m = zeros(148, 148);
            for k = 1:length(subject_folder)
                load(fullfile(subject_folder(k).folder, subject_folder(k).name));
                tmp_m = tmp_m + mean_AEC_FCs;
            end
            tmp_m = tmp_m ./ length(subject_folder);
            field_name = strcat('AEC_', replace(c(j).frequency_bands, '-', '_'));
            subject_struct(i).(field_name) = tmp_m;

            % mean_AECc
            path_to_matrix = fullfile(meg_path, [all_subfolders(i).name '_*'], c(j).frequency_bands, 'mean_AECc.mat');
            subject_folder = dir(path_to_matrix);
            tmp_m = zeros(148, 148);
            for k = 1:length(subject_folder)
                load(fullfile(subject_folder(k).folder, subject_folder(k).name));
                tmp_m = tmp_m + mean_AECc_FCs;
            end
            tmp_m = tmp_m ./ length(subject_folder);
            field_name = strcat('AECc_', replace(c(j).frequency_bands, '-', '_'));
            subject_struct(i).(field_name) = tmp_m;


            % mean_PLI
            path_to_matrix = fullfile(meg_path, [all_subfolders(i).name '_*'], c(j).frequency_bands, 'mean_PLI.mat');
            subject_folder = dir(path_to_matrix);
            tmp_m = zeros(148, 148);
            for k = 1:length(subject_folder)
                load(fullfile(subject_folder(k).folder, subject_folder(k).name));
                tmp_m = tmp_m + mean_PLI_FCs;
            end
            tmp_m = tmp_m ./ length(subject_folder);
            field_name = strcat('PLI_', replace(c(j).frequency_bands, '-', '_'));
            subject_struct(i).(field_name) = tmp_m;

            % mean_PLM
            path_to_matrix = fullfile(meg_path, [all_subfolders(i).name '_*'], c(j).frequency_bands, 'mean_PLM.mat');
            subject_folder = dir(path_to_matrix);
            tmp_m = zeros(148, 148);
            for k = 1:length(subject_folder)
                load(fullfile(subject_folder(k).folder, subject_folder(k).name));
                tmp_m = tmp_m + mean_PLM_FCs;
            end
            tmp_m = tmp_m ./ length(subject_folder);
            field_name = strcat('PLM_', replace(c(j).frequency_bands, '-', '_'));
            subject_struct(i).(field_name) = tmp_m;

            % mean_PLV
            path_to_matrix = fullfile(meg_path, [all_subfolders(i).name '_*'], c(j).frequency_bands, 'mean_PLV.mat');
            subject_folder = dir(path_to_matrix);
            tmp_m = zeros(148, 148);
            for k = 1:length(subject_folder)
                load(fullfile(subject_folder(k).folder, subject_folder(k).name));
                tmp_m = tmp_m + mean_PLV_FCs;
            end
            tmp_m = tmp_m ./ length(subject_folder);
            field_name = strcat('PLV_', replace(c(j).frequency_bands, '-', '_'));
            subject_struct(i).(field_name) = tmp_m;


            % mean_wPLI
            path_to_matrix = fullfile(meg_path, [all_subfolders(i).name '_*'], c(j).frequency_bands, 'mean_wPLI.mat');
            subject_folder = dir(path_to_matrix);
            tmp_m = zeros(148, 148);
            for k = 1:length(subject_folder)
                load(fullfile(subject_folder(k).folder, subject_folder(k).name));
                tmp_m = tmp_m + mean_wPLI_FCs;
            end
            tmp_m = tmp_m ./ length(subject_folder);
            field_name = strcat('wPLI_', replace(c(j).frequency_bands, '-', '_'));
            subject_struct(i).(field_name) = tmp_m;
            
        end
    end
end