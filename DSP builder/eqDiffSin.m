Fe = 125e6;
F = 10.7e6;
A = 516;
phi = -pi/2;

a1 = 2*cos(2*pi*F/Fe) * 2^16;
y_n_1 = round(A*cos(phi - 2*pi*F/Fe));
y_n_2 = round(A*cos(phi - 4*pi*F/Fe));

chips_lut=[hex2dec('744AC39B'),hex2dec('44AC39B7'),hex2dec('4AC39B74'),hex2dec('AC39B744'),hex2dec('C39B744A'),hex2dec('39B744AC'),hex2dec('9B744AC3'),hex2dec('B744AC39'),hex2dec('DEE06931'),hex2dec('EE06931D'),hex2dec('E06931DE'),hex2dec('06931DEE'),hex2dec('6931DEE0'),hex2dec('931DEE06'),hex2dec('31DEE069'),hex2dec('1DEE0693')];
