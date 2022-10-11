function m = plot_corr(meg_info, fmri, n, order)
%m = extract_corr(wPLI_100307_info, 5, C);
m = extract_corr(meg_info, n, order);

c = struct;
c(1).frequency_bands = "delta 2-4 Hz";
c(2).frequency_bands = "theta 5-7 Hz";
c(3).frequency_bands = "alpha 8-12 Hz";
c(4).frequency_bands = "beta 15-29 Hz";
c(5).frequency_bands = "gamma1 30-59 Hz";
c(6).frequency_bands = "gamma2 60-90 Hz";

m_scaled = scale_matrix_to_range(m);

lower_index = tril(fmri) ~= 0;

m_scaled(lower_index) = fmri(lower_index);

c_names = meg_info.RowNames;

figure;
imagesc(m_scaled); % plot the matrix
set(gca, 'XTick', 1:68); % center x-axis ticks on bins
set(gca, 'YTick', 1:68); % center y-axis ticks on bins
set(gca, 'XTickLabel', c_names(order)); % set x-axis labels
set(gca, 'YTickLabel', c_names(order)); % set y-axis labels
title(sprintf('fMRI vs MEG (%s)', c(n).frequency_bands), 'FontSize', 14); % set title
zmin = min(m_scaled(:));
zmax = max(m_scaled(:));
colormap(redwhiteblue(zmin, zmax));
xtickangle(90);


end