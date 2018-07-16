Fe = 100e6;
F_10M = 10.7e6;
F_500k = 0.5e6;
A = 516;
phi = -pi/2;

a1_10M = 2*cos(2*pi*F_10M/Fe) * 2^16;
y_n_1_10M = round(A*cos(phi - 2*pi*F_10M/Fe));
y_n_2_10M = round(A*cos(phi - 4*pi*F_10M/Fe));

a1_500k = 2*cos(2*pi*F_500k/Fe) * 2^16;
y_n_1_500k = round(A*cos(phi - 2*pi*F_500k/Fe));
y_n_2_500k = round(A*cos(phi - 4*pi*F_500k/Fe));

chips_lut=[hex2dec('744AC39B'),hex2dec('44AC39B7'),hex2dec('4AC39B74'),hex2dec('AC39B744'),hex2dec('C39B744A'),hex2dec('39B744AC'),hex2dec('9B744AC3'),hex2dec('B744AC39'),hex2dec('DEE06931'),hex2dec('EE06931D'),hex2dec('E06931DE'),hex2dec('06931DEE'),hex2dec('6931DEE0'),hex2dec('931DEE06'),hex2dec('31DEE069'),hex2dec('1DEE0693')];
