%% Objective
%% Demonstrate how permutation matrix helps in creating matrix which generates circularly shifted samples.
% MATLAB Code
% 1. Initialize the permutation matrix

clear all;
clc;
P = [0 0 1; 1 0 0; 0 1 0];
disp(P)
% 2. Initialize 1D column vector (to be shifted circularly)

x = [ 7 ; 8 ; 9];
disp(x); 
% verify it is a column vector
disp(size(x));

% print as a row vector
disp(x'); 
% 3. Calcuate P*x i.e. initial vector with no circularly shifted samples

P1 = P*x;
disp(P1);
% print as a row vector
disp(P1'); 
% 4. Calculate circular shift of P1 mathematically using permutation matrix

P2 = P*P;
disp(P2);
%% 
% *Verify*:  circular shift of P1 using <https://www.mathworks.com/help/matlab/ref/circshift.html 
% matlab in built function>

Y2 = circshift(P,1);
disp(Y2)
%% 
% Calculate shifted samples of x using P2

C2_calc = P2*x;
disp(C2_calc); 
% print as a row vector
disp(C2_calc'); 
%% 
% *Verify*: calculation of shifted samples calculated using in-built function 
% circshift

C2_inbuilt = Y2*x;
disp(C2_inbuilt); 
% print as a row vector
disp(C2_calc'); 
%% 
% 
% 5. Calculate circular shift of P2 mathematically using permutation matrix

P3 = P2*P;
disp(P3)
%% 
% *Verify*: circular shift of P3 using <https://www.mathworks.com/help/matlab/ref/circshift.html 
% matlab in built function>

Y3 = circshift(P,2);
disp(Y3)
%% 
% Calculate shifted samples calculated uisng x and P3

C3_calc = P3*x;
disp(C3_calc);
% print as a row vector
disp(C3_calc'); 
%% 
% *Verify*: Verification of shifted samples calculated using in-built function 
% circshift

C3_inbuilt = Y3*x;
disp(C3_inbuilt);
% print as a row vector
disp(C3_calc');