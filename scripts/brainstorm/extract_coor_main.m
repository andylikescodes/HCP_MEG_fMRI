labels = info.RowNames;
labels = labels(order);
save('D:\HCP_MEG_fMRI\output\labels.mat', 'labels');


order = [1:2:68, 2:2:68];

%corr_path = 'E:\files\brain\brainstorm_db\preliminary_results\data\Group_analysis\@intra\timefreq_connectn_plv_average_221009_2055.mat';
corr_path = 'E:\files\brain\brainstorm_db\preliminary_results\data\Group_analysis\@intra\';
cohere_file = 'timefreq_connectn_corr_average_221009_2102.mat';
full_file_path = fullfile(corr_path, cohere_file);

output_path = 'D:\HCP_MEG_fMRI\output\';
cohere_save = 'Corr';
full_save_path = fullfile(output_path, cohere_save);
info = load(full_file_path);

R = bst_memory('GetConnectMatrix', info);
corr = R(order, order);

save( 'D:\HCP_MEG_fMRI\output\corr\corr.mat', 'corr')


%corr_path = 'E:\files\brain\brainstorm_db\preliminary_results\data\Group_analysis\@intra\timefreq_connectn_plv_average_221009_2055.mat';
corr_path = 'E:\files\brain\brainstorm_db\preliminary_results\data\Group_analysis\@intra\';
cohere_file = 'timefreq_connectn_cohere_average_221009_2100.mat';
full_file_path = fullfile(corr_path, cohere_file);

output_path = 'D:\HCP_MEG_fMRI\output\';
cohere_save = 'cohere';
full_save_path = fullfile(output_path, cohere_save);

% for i=1:6
%     output_corr(corr_path, i, output_path);
% end



info = load(full_file_path);

R = bst_memory('GetConnectMatrix', info);

delta_idx = (info.Freqs <= 4) & ((info.Freqs >= 2));
theta_idx = (info.Freqs <= 7) & ((info.Freqs >= 5));
alpha_idx = (info.Freqs <= 12) & ((info.Freqs >= 8));
beta_idx = (info.Freqs <= 29) & ((info.Freqs >= 15));
gamma1_idx = (info.Freqs <= 59) & ((info.Freqs >= 30));
gamma2_idx = (info.Freqs <= 90) & ((info.Freqs >= 60));

delta = mean(R(order,order,1,delta_idx), 4);
theta = mean(R(order,order,1,theta_idx), 4);
alpha = mean(R(order,order,1,alpha_idx), 4);
beta = mean(R(order,order,1,beta_idx), 4);
gamma1 = mean(R(order,order,1,gamma1_idx), 4);
gamma2 = mean(R(order,order,1,gamma2_idx), 4);

c = struct;
c(1).frequency_bands = "delta 2-4 Hz";
c(2).frequency_bands = "theta 5-7 Hz";
c(3).frequency_bands = "alpha 8-12 Hz";
c(4).frequency_bands = "beta 15-29 Hz";
c(5).frequency_bands = "gamma1 30-59 Hz";
c(6).frequency_bands = "gamma2 60-90 Hz";

save('D:\HCP_MEG_fMRI\output\cohere\delta 2-4 Hz.mat', 'delta');
save('D:\HCP_MEG_fMRI\output\cohere\theta 5-7 Hz.mat', 'theta');
save('D:\HCP_MEG_fMRI\output\cohere\alpha 8-12 Hz.mat', 'alpha');
save('D:\HCP_MEG_fMRI\output\cohere\beta 15-29 Hz.mat', 'beta');
save('D:\HCP_MEG_fMRI\output\cohere\gamma1 30-59 Hz.mat', 'gamma1');
save('D:\HCP_MEG_fMRI\output\cohere\gamma2 60-90 Hz.mat', 'gamma2');