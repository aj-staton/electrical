% Written by Austin Staton
% Used for ELCT 221 (Circuits) at the UofSC.

clc
clear all

% Define all given values.
f = 1.5e6; om = 2*pi*f;
R1 = 6; R2 = 8; 
L1 = 0.9e-6; L2 = 0.8e-6;
C1 = 26e-9; C2 = 21e-9;

% Make needed things complex.
% Voltage and current sources were given, but need to be complex.
Vs1 = 15*e^(j*0.1);
Vs2 = 6*e^(j*0.2);
Is = 0.7*e^(j*0.1);
ZL1 = j*om*L1;
ZL2 = j*om*L2;
ZC1 = -j/(om*C1);
ZC2 = -j/(om*C2);

% This nodal analysis will be done by inspection.
Z(1,1) = 1/R1+1/ZL1+1/ZC1; % Sum of all impedances connected to Node 1
Z(1,2) = -1/ZL1; %Negative of connecting impedance between node 1, node 2.
Z(1,3) = -1/ZC1;
Z(2,1) = -1/ZL1;
Z(2,2) = 1/ZL1+1/ZL2+1/ZC2;
Z(2,3) = -1/ZL2;
Z(3,1) = -1/ZC1;
Z(3,2) = -1/ZL2;
Z(3,3) = 1/ZC1+1/ZL2+1/R2;

I(1,1) = (Vs1/R1)+Is; % Sum of all current sources flowing into node 1.
I(2,1) = Vs2/ZC2; % " ", but for node 2.
I(3,1) = -Is;

F = Z\I;
F = Z\I
Fm = abs(F)
% Q1 : 9.314 V
F1m = abs(F(1))
% Q2 : -0.415 rad
F1ph = angle(F(1))
% Q3 : 7.629 V
F2m = abs(F(2))
% Q4 : -0.207 rad
F2ph = angle(F(2))

IL2 = (F(2)-F(3))/ZL2;

% Q5 : 0.916 A
IL2m = abs(IL2)
% Q6 : -2.624 rad
IL2ph = angle(IL2)
