function m_scaled = scale_matrix_to_range(m)

bigger_than_0_idx = m > 0;
v_bigger_than_0 = m(bigger_than_0_idx);

smaller_than_0_idx = m < 0;
v_smaller_than_0 = m(smaller_than_0_idx);

if ~isempty(v_bigger_than_0)
    zmax_pos = max(v_bigger_than_0);
    tmp_m_pos = bigger_than_0_idx * zmax_pos;
    tmp_m_pos(tmp_m_pos == 0) = 1;
else
    tmp_m_pos = ones(size(m));
end

if ~isempty(v_smaller_than_0)
    zmax_neg = max(abs(v_smaller_than_0));
    tmp_m_neg = smaller_than_0_idx * zmax_neg;
    tmp_m_neg(tmp_m_neg == 0) = 1;
else
    tmp_m_neg = ones(size(m));

end

m_scaled = m ./ tmp_m_pos ./ tmp_m_neg;



end