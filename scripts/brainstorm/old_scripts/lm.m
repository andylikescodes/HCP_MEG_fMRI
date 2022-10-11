function lm(meg_info, fmri, order)
    
% c = struct;
% c(1).frequency_bands = "delta 2-4 Hz";
% c(2).frequency_bands = "theta 5-7 Hz";
% c(3).frequency_bands = "alpha 8-12 Hz";
% c(4).frequency_bands = "beta 15-29 Hz";
% c(5).frequency_bands = "gamma1 30-59 Hz";
% c(6).frequency_bands = "gamma2 60-90 Hz";
R = bst_memory('GetConnectMatrix', meg_info);

R_reordered = R(order,order,:,:);

s = size(R_reordered);

X = zeros(size(1)*size(2),s(4));

y = zeros(size(1)*size(2));

for i=1:s(1)
    for j=1:s(2)
        X(i,j) 
    end
end
    

end