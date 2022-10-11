function plot_corr_v2(meg, fmri, n, c_names)

c = struct;
c(1).frequency_bands = "delta 2-4 Hz";
c(2).frequency_bands = "theta 5-7 Hz";
c(3).frequency_bands = "alpha 8-12 Hz";
c(4).frequency_bands = "beta 15-29 Hz";
c(5).frequency_bands = "gamma1 30-59 Hz";
c(6).frequency_bands = "gamma2 60-90 Hz";

fmri_scaled = scale_matrix_to_range(fmri);
meg_scaled = scale_matrix_to_range(meg);


lower_index = tril(fmri_scaled) ~= 0;

meg_scaled(lower_index) = fmri_scaled(lower_index);

figure;
imagesc(meg_scaled); % plot the matrix
set(gca, 'XTick', 1:68); % center x-axis ticks on bins
set(gca, 'YTick', 1:68); % center y-axis ticks on bins
set(gca, 'XTickLabel', c_names); % set x-axis labels
set(gca, 'YTickLabel', c_names); % set y-axis labels
title(sprintf('fMRI vs MEG (%s)', c(n).frequency_bands), 'FontSize', 14); % set title
zmin = min(meg_scaled(:));
zmax = max(meg_scaled(:));
colormap(redwhiteblue(zmin, zmax));
xtickangle(90);


end