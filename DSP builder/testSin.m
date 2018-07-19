clear all
eqDiffSin
y = [];
for i = 1:1000
    y(i) = round(a1_500k*y_n_1_500k/2^16) - y_n_2_500k;
    y_n_2_500k = y_n_1_500k;
    y_n_1_500k = y(i);
end