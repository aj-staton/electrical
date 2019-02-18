clc
clear all

% Define all given values.
R1 = 6; R2 = 9; R3 = 4;
L1 = 0.6e-6; L2 = 0.8e-6; C1 = 22e-9; 
f = 1.8e6; om = 2*pi*f;
Vs1m = 9; Vs1ph = 0;

% Create the complex numbers that need to be complex (Impedances and Voltage).
Vs1 = Vs1m;
ZL1 = j*om*L1; ZL2 = j*om*L2;
ZC1 = -j/(om*C1);

% Create Matricies Y, I, to solve for unknown potentials.
% This was done by inspection.
Y(1,1) = 1/R1+1/R2+1/ZL1; % Y(X,X) is the sum of all impedances connected to Node X.
Y(1,2) = -1/ZL1; % Y(X,Y) is the opposite of the impedance between Nodes X,Y.
Y(1,3) = -1/R2; 
Y(2,1) = Y(1,2);
Y(2,2) = 1/ZL1+1/ZC1+1/R3;
Y(2,3) = -1/ZC1;
Y(3,1) = Y(1,3);
Y(3,2) = Y(2,3);
Y(3,3) = 1/R2+1/ZC1+1/L2;

I(1,1) = Vs1/R1; % I(X, 1) is the amount of direct voltage flowing into Node X.
I(2,1) = 0;
I(3,1) = 0;

% Let F represent the matrix of unknown potentials.
F = Y\I;

% Solutions
disp('Q1 & Q2')
F2m = abs(F(2))
F2ph = angle(F(2))
disp('Q3 & Q4')
F3m = abs(F(3))
F3ph = angle(F(3))
disp('Current through R2 flowing downward:') % I = V/R
IR2 = (F(1)-F(3))/R2;
IR2m = abs(IR2)
IR2ph = angle(IR2)

