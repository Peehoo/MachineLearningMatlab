function accu = testsvm(test_data, test_label, w, b)
% Test linear SVM 
% Input:
%  test_data: M*D matrix, each row as a sample and each column as a
%  feature
%  test_label: M*1 vector, each row as a label
%  w: feature vector 
%  b: bias term
%
% Output:
%  accu: test accuracy (between [0, 1])
%
% CSCI 576 2014 Fall, Homework 
p = test_data*w + b;
p(p<0)=-1;
p(p>=0)=1;
accu = 1 - sum(abs(test_label - p)/2)/size(test_data,1);
