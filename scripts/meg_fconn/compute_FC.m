% Setup path
% addpath(genpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/megconnectome-3.0'));
% addpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/fieldtrip-20220707/fieldtrip-20220707');
% ft_defaults
% addpath(genpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/cifti-matlab'));
addpath(genpath('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/external/MEG_fingerprints'));


save_path = '/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/FC/';

% calculate
mfiles = dir('/home/deliang@chapman.edu/Documents/HCP_MEG_fMRI/output/source_localization_epochs/*.mat');

fs = 5.086275249048788e+02

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

for k = 1:length(c)
    folderName = fullfile(save_path, c(k).frequency_bands);
    if ~exist(folderName, 'dir')
        mkdir(folderName);
    end

    for file = mfiles'
        disp(file);
        load(fullfile(file.folder, file.name));
        
        matrix_size = size(emptyMatrix);
        
        AEC_FCs = zeros(matrix_size(1), matrix_size(1), matrix_size(3));
        AECc_FCs = zeros(matrix_size(1), matrix_size(1), matrix_size(3));
        PLI_FCs = zeros(matrix_size(1), matrix_size(1), matrix_size(3));
        PLV_FCs = zeros(matrix_size(1), matrix_size(1), matrix_size(3));

        for i = 1:matrix_size(3)
            band_pass_m = zeros(matrix_size(1), matrix_size(2));

            for j = 1:matrix_size(1)
                band_pass_m(j,:) = bandpass(emptyMatrix(j,:,i), c(k).range, fs);
            end

            [AEC, AECc] = amplitudeenvelopecorrelation(band_pass_m');
            PLI_m = PLI(band_pass_m);
            PLV_m = PLV(band_pass_m);

            AEC_FCs(:,:,i) = AEC;
            AECc_FCs(:,:,i) = AECc;
            PLI_FCs(:,:,i) = PLI_m;
            PLV_FCs(:,:,i) = PLV_m;
        end

        subject_folder = fullfile(folderName, file.name);

        if ~exist(subject_folder, 'dir')
            mkdir(subject_folder);
        end

        save(fullfile(subject_folder, 'AEC_FCs.mat'), 'AEC_FCs');
        save(fullfile(subject_folder, 'AECc_FCs.mat'), 'AECc_FCs');
        save(fullfile(subject_folder, 'PLI_FCs.mat'), 'PLI_FCs');
        save(fullfile(subject_folder, 'PLV_FCs.mat'), 'PLV_FCs');

        % Plot the mean matrixs

        mean_AEC_FCs = mean(AEC_FCs, 3);
        mean_AECc_FCs = mean(AECc_FCs, 3);
        mean_PLI_FCs = mean(PLI_FCs, 3);
        mean_PLV_FCs = mean(PLV_FCs, 3);

        figure;
        subplot(2,2,1);
        imagesc(mean_AEC_FCs); % plot the matrix
        title(sprintf('AEC ', c(k).frequency_bands), 'FontSize', 14); % set title
        colormap(redwhiteblue(0, 1));
        subplot(2,2,2);
        imagesc(mean_AECc_FCs); % plot the matrix
        title(sprintf('AECc ', c(k).frequency_bands), 'FontSize', 14); % set title
        colormap(redwhiteblue(0, 1));
        subplot(2,2,3);
        imagesc(mean_PLI_FCs); % plot the matrix
        title(sprintf('PLI ', c(k).frequency_bands), 'FontSize', 14); % set title
        colormap(redwhiteblue(0, 1));
        subplot(2,2,4);
        imagesc(mean_PLV_FCs); % plot the matrix
        title(sprintf('PLV ', c(k).frequency_bands), 'FontSize', 14); % set title
        colormap(redwhiteblue(0, 1));

        saveas(gcf,fullfile(subject_folder, 'FC_plot.png'))

    end

end