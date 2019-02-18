% Written by Austin Staton
% This solves question 2 on the ELCT 221 final exam.
% Date: 12/10/18

clc
clear all

% Define all given values.
Vs = 26*exp(j*1);
f = 28e6; om = 2*pi*f;
Zth = 295+j*140;

% Matching load impedance is the conjucate of the total impedance.
ZLm = conj(Zth);

% Question 1:
disp('Real Part of Matching Load Impedance:')
ZmReal = real(ZLm) % Ans: 295 Ohm

% Question 2:
disp('Imaginary Part of Matching Load Impedance:')
ZmImag = imag(ZLm) % Ans: -140 Ohm


% Power: 

% Define the voltage and current across the load.
IL = Vs/(ZLm+Zth);
VL = IL*ZLm

% The complex power across the load, S.
S = VL*conj(IL)/2;

% Question 3:
disp('The average/active power delivered into the matching load (W):')
% This is the real part of the complex power.
P = real(S) % Ans: 0.286 W

% Question 4:
disp('The absolute value of the reactive power in the matching load (W):')
% This is the imaginary part of complex power.
Q = abs(imag(S)) % Ans: 0.136 W

% Question 5: 
% There's a series connection of resistor and capacitor bc ZmImag < 0.

% Question 6: 
disp('Equivalent capaitance value: ')
C = -1/(imag(Zth)*om) % Ans: 40.6 pF