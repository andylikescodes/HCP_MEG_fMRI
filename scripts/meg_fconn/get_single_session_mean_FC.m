function [AEC, AECc, PLI, PLM, PLV, wPLI] = get_single_session_mean_FC(all_subjects, frequency_band)

counter_AEC = 0;
counter_AECc = 0;
counter_PLI = 0;
counter_PLM = 0;
counter_PLV = 0;
counter_wPLI = 0;

mean_holder_AEC = zeros(148, 148);
mean_holder_AECc = zeros(148, 148);
mean_holder_PLI = zeros(148, 148);
mean_holder_PLM = zeros(148, 148);
mean_holder_PLV = zeros(148, 148);
mean_holder_wPLI = zeros(148, 148);


for j = 1:length(all_subjects)

    folder_name = fullfile(all_subjects(j).folder, all_subjects(j).name, frequency_band);
    
    AEC_file = fullfile(folder_name, 'mean_AEC.mat');
    if exist(AEC_file)   
        load(AEC_file);
        counter_AEC = counter_AEC + 1;
        mean_holder_AEC = mean_holder_AEC + mean_AEC_FCs;
    end

    AECc_file = fullfile(folder_name, 'mean_AECc.mat');
    if exist(AECc_file)   
        load(AECc_file);
        counter_AECc = counter_AECc + 1;
        mean_holder_AECc = mean_holder_AECc + mean_AECc_FCs;
    end

    PLI_file = fullfile(folder_name, 'mean_PLI.mat');
    if exist(PLI_file)   
        load(PLI_file);
        counter_PLI = counter_PLI + 1;
        mean_holder_PLI = mean_holder_PLI + mean_PLI_FCs;
    end

    PLM_file = fullfile(folder_name, 'mean_PLM.mat');
    if exist(PLM_file)   
        load(PLM_file);
        counter_PLM = counter_PLM + 1;
        mean_holder_PLM = mean_holder_PLM + mean_PLM_FCs;
    end

    PLV_file = fullfile(folder_name, 'mean_PLV.mat');
    if exist(PLV_file)   
        load(PLV_file);
        counter_PLV = counter_PLV + 1;
        mean_holder_PLV = mean_holder_PLV + mean_PLV_FCs;
    end

    wPLI_file = fullfile(folder_name, 'mean_wPLI.mat');
    if exist(wPLI_file)   
        load(wPLI_file);
        counter_wPLI = counter_wPLI + 1;
        mean_holder_wPLI = mean_holder_wPLI + mean_wPLI_FCs;
    end

end

AEC = mean_holder_AEC ./ counter_AEC;
AECc = mean_holder_AECc ./ counter_AECc;
PLI = mean_holder_PLI ./ counter_PLI;
PLM = mean_holder_PLM ./ counter_PLM;
PLV = mean_holder_PLV ./ counter_PLV;
wPLI = mean_holder_wPLI ./ counter_wPLI;


