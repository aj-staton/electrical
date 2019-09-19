% Fourier Transform for a sawtooth wave form described by:
%   f(t) = 5t, 0 s < t < 4 s

syms t n
assume(n, 'integer')

% Given periodic function...
T = 4;
f(t) = 5*t;

% Calculate from the givens...
f0 = 1/T;
om = 2*pi*f0;

% The Substance of the fourier transform 
a0 = (1/T)*int(f0,t,0,T);
a(n) = (2/T)*int(f0*cos(n*om*t),t,0,4);
b(n) = (2/T)*int(f0*sin(n*om*t),t,0,4);

simplify(a(n))
simplify(b(n))

% Here is the full transform.
f(t) = a0 + (-20/(n*pi))*sin(n*pi/2*t);

