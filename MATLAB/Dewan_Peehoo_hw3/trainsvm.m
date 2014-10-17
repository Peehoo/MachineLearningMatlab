function [w,b] = trainsvm(train_data, train_label, C)
% Train linear SVM (primal form)
% Input:
%  train_data: N*D matrix, each row as a sample and each column as a
%  feature
%  train_label: N*1 vector, each row as a label
%  C: tradeoff parameter (on slack variable side)
%
% Output:
%  w: feature vector (column vector)
%  b: bias term
%
% CSCI 576 2014 Fall, Homework 3

[n d] = size(train_data);
maxIter = 100; % Running for 100 iterations
opts = optimset('Algorithm', 'interior-point-convex','MaxIter',maxIter, 'Display','off'); 

signedXY = train_data.*repmat(train_label,1,d);
problem.options = opts;
problem.solver = 'quadprog';

problem.H = diag([ones(d,1)' zeros(n,1)' 0]);
problem.f = C*[zeros(d,1)' ones(n,1)' 0]';
problem.lb = -1*[inf(d,1)' zeros(n,1)' inf]';
problem.Aineq = (-1)*[signedXY,eye(n,n),train_label];
problem.bineq = -ones(n,1);

result = quadprog(problem);
b = result(size(result,1));
w = result(1:d);