%% Objective
%% Plt and Visualize 2-D Circulant Matrix
% <https://www.mathworks.com/matlabcentral/answers/339470-how-to-write-a-circulant-matrix-where-the-elements-are-matrices-thanks 
% Source>

% Supposing the matrices you want to use in a circulant pattern are 
% stored as a M x N x K array (where M x N is the size of each individual matrix block 
% and you want a K x K circulant pattern)

M = 2;
N = 3;
K = 3;
% Original matrix
A = randn(M,N,K);
% Coefficients for block circulant
Ac = permute(A, [1 3 2]);
Ac = cat(2, Ac(:, 2:K, :), Ac);
% Create the block-circulant matrix using convn
I = reshape(eye(K), [1 K 1 K]);
C = convn(I, Ac);
C = reshape(C(:, K:(2*K-1), :, :), [M*K, N*K]);
disp(C);
imagesc(C);