%% Objective
%% Plt and Visualize 1-D Circulant Matrix


clear all;
clc;

n = 4; m = 3;

% initialize 1-D matrix
A = 1:n;

% Verify what 1-D matrix would look like
disp(A);

% Create n-by-n circulant matrix
B_block = gallery('circul', A)';
disp(B_block);
% Plot the Matrix Color Coded

imagesc(B_block);