% Written by Austin Staton
% This solves question 1 on the ELCT 221 final exam.
% Date: 12/10/18

clc
clear all

% Define all given values.
f = 8e3; om = 2*pi*f;
Vsm = 8; Vsph = 0.2;
R1 = 25; R2 = 35;
L1 = 1e-3;;L2 = 0.3e-3; C1 = 0.3e-6;

% Make needed values complex.
Vs = Vsm*e^(j*Vsph);
ZL1 = j*om*L1;
ZL2 = j*om*L2;
ZC1 = -j/(om*C1);

% Combine series connections for simplififcation purposes.
Z1 = R1 + ZL1;

% Apply Nodal Potential Analysis to find all node potentials.
% Let Node 2 be output "a" and let ouput "b" be ground.

% 2 unknown nodes, therefore use a 2x2 matrix. 
Y(1,1) = 1/Z1+1/ZC1+1/ZL2;
Y(1,2) = -1/ZL2;
Y(2,1) = Y(1,2);
Y(2,2) = 1/ZL2+1/R2;

Is(1,1) = Vs/Z1;
Is(2,1) = 0;

F = Y\Is; % "F" is the node potential matrix.

Vth = F(2) - 0;

% Question 1
disp('Thevenin Source Amplitude (V): ')
abs(Vth) % Ans: 3.855 V

% Question 2
disp('Thevenin Source Phase (rad): ')
angle(Vth) % Ans: -0.978 rad

% For question 3 and 4, the voltgae source needs to have a wire through it (zeroed)
% and the total impedance sum should be calculated. 
Za = ZC1*Z1/(ZC1+Z1);
Zb = Za + ZL2;
Zth = Zb*R2/(Zb+R2);

% Question 3
disp('Thevenin Equivalent Impedance (real part): ')
real(Zth) % Ans: 27.56 Ohm

% Question 4
disp('Thevenin Equivalent Impedance (imaginary pary): ')
imag(Zth) % Ans: 1.339 Ohm