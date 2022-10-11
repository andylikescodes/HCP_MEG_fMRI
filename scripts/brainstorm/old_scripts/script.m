m = extract_corr(info, 6, order);
order = [1:2:68, 2:2:68];
c_names = info.RowNames;
figure;
imagesc(m); % plot the matrix
set(gca, 'XTick', 1:68); % center x-axis ticks on bins
set(gca, 'YTick', 1:68); % center y-axis ticks on bins
set(gca, 'XTickLabel', c_names(order)); % set x-axis labels
set(gca, 'YTickLabel', c_names(order)); % set y-axis labels
zmin = min(m(:));
zmax = max(m(:));
colormap(redwhiteblue(zmin, zmax));
xtickangle(90);