function eigenvecs = pca_fun(X, d)

% Implementation of PCA
% input:
%   X - N*D data matrix, each row as a data sample
%   d - target dimensionality, d <= D
% output:
%   eigenvecs: D*d matrix
%
% usage:
%   eigenvecs = pca_fun(X, d);
%   projection = X*eigenvecs;
%
% CSCI 576 2014 Fall, Homework 5

Sigma = X'*X;
%[U,S,V] = svd(Sigma);
%eigenvecs = U(:,1:d);
[U, V] = eig(Sigma);
eigenvecs = U(:, 2500-d+1:2500);
%eigenvecs = U(:,1:d);
