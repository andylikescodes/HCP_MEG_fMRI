n = 10;
for i=1:n
filename = strcat("resultsROI_Subject", sprintf('%03d', i) , "_Condition001.mat");
load(filename);
if i == 1
    tmp = Z;
else
    tmp = tmp + Z;
end

avg_m = tmp./n;

end

order = [1:2:68, 2:2:68];

s = fillmissing(avg_m(112-67:112, 112-67:112), 'constant', 0);

s_scaled = scale_matrix_to_range(s);

%plot_corr(info100307, s_scaled, 5, order);

files = dir("./output/PLV/*.mat");

tmp_plv = zeros(68, 68);

for i=1:length(files)
    path = fullfile(files(i).folder, files(i).name);
    info = load(path);
    m = extract_corr(info, 5, order);
    tmp_plv = tmp_plv + m;
end
tmp_plv = tmp_plv ./ n;

plot_corr_v2(tmp_plv, s, 5, info.RowNames(order));


plot_corr(coh_hilbert_gamma1_100307, s_scaled, 5, order);

plot_corr(wPLI_100307_info, s_scaled,6, order);
