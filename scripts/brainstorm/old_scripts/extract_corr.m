function m = extract_corr(info, n, order)

R = bst_memory('GetConnectMatrix', info);

m = R(order, order, 1, n);