function coefs = cal_corr(m1, m2)

m1_tmp = m1(tril(m1, -1) ~= 0);

m2_tmp = m2(tril(m2, -1) ~= 0);

coefs = corrcoef(m1_tmp, m2_tmp);

end