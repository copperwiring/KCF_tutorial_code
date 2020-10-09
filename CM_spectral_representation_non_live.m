%% Objective
%% Demonstrate spectral representation of Circulant Matrix
% 
% See .mlx file i.e. matlab live script for equations
% 

% See proof on page 38 here: <https://www.robots.ox.ac.uk/~joao/publications/henriques_phd.pdf 
% https://www.robots.ox.ac.uk/~joao/publications/henriques_phd.pdf> 

clc;
clear all;

% Generate a 1-D vector using 5 random values
x = randn(1,5);
n = length(x);

% Calculate a n-by-n complex discrete Fourier transform matrix
F = dftmtx(n);

% Generate ciculant matrix using MATLAB commands
C = gallery('circul',x);

% Calculate
C1 = F*diag(F*x(:))/F;
C2 = F'*diag(F'*x(:))*F/n;

% Verify that C, C1 and C2 have similar results
disp(C);
disp(C1);
disp(C2);