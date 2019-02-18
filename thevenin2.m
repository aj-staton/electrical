clc
clear all

Vs =18*e^(j*0.25);
f = 22e3; om = 2*pi*f;
Rs = 4; R1 = 14; R2 = 9; R3 = 6;
L1 = 0.29e-3; L2 = 0.11e-3; C = 0.9e-6;
ZL1 = j*om*L1; ZL2 = j*om*L2; ZC = -j/(om*C);

% Combine Connections in series.
Z2 = R2+ZL2;
Z1 = R1+ZL1;
Z3 = R3+ZC;

% Nodal Analysis
Y(1,1) = 1/Rs+1/Z1+1/Z2;
Y(1,2) = -1/Z2;
Y(2,1) = Y(1,2);
Y(2,2) = 1/Z2+1/Z3;

I(1,1) = Vs/Rs;
I(2,1) = 0;

F = Y\I;

Vth = F(2);
Vthm = abs(Vth)
Vthph = angle(Vth)

% Equivalent Impedance
Za = Rs*Z1/(Rs+Z1);
Zb = Za + Z2;
Zth = Zb*Z3/(Zb+Z3);
ZthReal = real(Zth)
ZthImag = imag(Zth)

% Matching Load Impedance
Zm = conj(Zth);
ZmReal = real(Zth)
ZmImag = imag(Zth)