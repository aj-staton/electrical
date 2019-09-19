% Written by Austin Staton
% Used for ELCT 221 (Circuits) at the UofSC.

clc
clear all

% Define given values. 
Vs1 = 100*e^(j*0.1);
Vs2 = 40*e^(j*0.2);
Vs3 = 35*e^(j*0.1);
f = 20e3; om = 2*pi*f;

R1 = 310; R2 = 190; 
L1 = 9e-3; L2 = 6e-3;
C1 = 15e-9; C2 = 15e-9;

% Make needed things complex.
ZL1 = j*om*L1;
ZL2 = j*om*L2;
ZC1 = -j/(om*C1);
ZC2 = -j/(om*C2);

% Add series components, ZC2, R2
Z2 = ZC2+R2;

Im(1,1) = ZC1+R1+ZL1; % Sum of all impedances along mesh 1.
Im(1,2) = -R1; % Negative of shared impedance between mesh 1, 2.
Im(1,3) = -ZL1;
Im(2,1) = Im(1,2);
Im(2,2) = Z2+ZL2+R1;
Im(2,3) = -ZL2;
Im(3,1) = Im(1,3);
Im(3,2) = Im(2,3);
Im(3,3) = ZL1+ZL2;

V(1,1) = Vs1-Vs2; % Sum of Voltages going along mesh 1.
V(2,1) = 0;
V(3,1) = Vs2-Vs3;

Imesh = Im\V;

IC2 = Imesh(2);
% Q1 : 0.0822 A
IC2m = abs(IC2)
% Q2 : 1.9619 rad
IC2ph = angle(IC2)

IL1 = Imesh(1)-Imesh(3);
% Q3 : 0.0292 A
IL1m = abs(IL1)
% Q4 : -0.1801 rad
IL1ph = angle(IL1)

PhiL1 = Vs2 + IL1*ZL1; % The '+' is because mesh3 > mesh 1, so IL1 < 0.
% Q5 : 60.5674 V
PhiL1m = abs(PhiL1)
% Q6 : 0.7305 rad
PhiL1ph = angle(PhiL1)
