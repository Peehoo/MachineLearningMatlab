function [accuracy_test, accuracy_train] = knn_classify(X_train, Y_train, X_test, Y_test, k)
% k-nearest neighbor classifier
% Input:
%  train_data: N*D matrix, each row as a sample and each column as a
%  feature
%  train_label: N*1 vector, each row as a label
%  new_data: M*D matrix, each row as a sample and each column as a
%  feature
%  new_label: M*1 vector, each row as a label
%  k: number of nearest neighbors
%
% Output:
%  new_accu: accuracy of classifying new_data
%  train_accu: accuracy of classifying train_data (using leave-one-out
%  strategy)
%
% CSCI 576 2014 Fall, Homework 1

EstimatedY = zeros(size(Y_train));
for i=1:size(X_train,1)
    Xi = X_train(i,:);
    repeatXi = repmat(Xi, size(X_train,1), 1);
    distanceX = sqrt(sum((X_train - repeatXi).*(X_train - repeatXi),2));
    distanceX(i,1) = inf;
    [Y, I] = sort(distanceX(:,1));
    sortedY = Y_train(I,:);
    sortedTopKOnY = sortedY(1:k,:);
    if(size(sortedTopKOnY, 1) == 1)
        votes = sortedTopKOnY;
    else
        votes = sum(sortedTopKOnY);
    end
    votes(1,votes(1,:)<max(votes(1,:)))=0;
    votes(1,votes(1,:)==max(votes(1,:)))=1;
    while(size(votes(votes==max(votes)),2)>1)
        votes(find(votes,1))=0;
    end
    EstimatedY(i,:) = votes;
end

D = Y_train - EstimatedY;
D(D==-1) = 1;
error_train = sum(sum(D))/(2* size(X_train, 1));
accuracy_train = 1 - error_train;

EstimatedY = zeros(size(Y_test));
for i=1:size(X_test,1)
    Xi = X_test(i,:);
    repeatXi = repmat(Xi, size(X_train,1), 1);
    distanceX = sqrt(sum((X_train - repeatXi).*(X_train - repeatXi),2));
    [Y, I] = sort(distanceX(:,1));
    sortedY = Y_train(I,:);
    sortedTopKOnY = sortedY(1:k,:);
    
    if(size(sortedTopKOnY, 1) == 1)
        votes = sortedTopKOnY;
    else
        votes = sum(sortedTopKOnY);
    end
    
    votes(1,votes(1,:)<max(votes(1,:)))=0;
    votes(1,votes(1,:)==max(votes(1,:)))=1;
    while(size(votes(votes==max(votes)),2)>1)
        votes(find(votes,1))=0;
    end
    EstimatedY(i,:) = votes;
end

D_test = Y_test - EstimatedY;
D_test(D_test==-1) = 1;
error_test = sum(sum(D_test))/(2* size(X_test, 1));
accuracy_test = 1 - error_test;

