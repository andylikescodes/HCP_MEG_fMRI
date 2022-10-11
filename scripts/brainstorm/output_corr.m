function m = output_corr(corr_path, n, save_path)

c = struct;
c(1).frequency_bands = "delta 2-4 Hz";
c(2).frequency_bands = "theta 5-7 Hz";
c(3).frequency_bands = "alpha 8-12 Hz";
c(4).frequency_bands = "beta 15-29 Hz";
c(5).frequency_bands = "gamma1 30-59 Hz";
c(6).frequency_bands = "gamma2 60-90 Hz";

R = load(corr_path);
order = [1:2:68, 2:2:68];
m = extract_corr(R, n, order);

tmp = strcat(fullfile(save_path, c(n).frequency_bands), '.mat');

save(tmp, 'm');