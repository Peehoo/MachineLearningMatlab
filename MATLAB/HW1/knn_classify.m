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
    max=0;
    votes = zeros(4,1);
    Xi = X_train(i,:);
    repeatXi = repmat(Xi, size(X_train,1), 1);
    distanceX = sqrt(sum((X_train - repeatXi).*(X_train - repeatXi),2));
    distanceX(i,1) = inf;
    [Y, I] = sort(distanceX(:,1));
    sortedY = Y_train(I);
    sortedTopKOnY = sortedY(1:k,:);
    if(size(sortedTopKOnY, 1) == 1)
        EstimatedY(i) = sortedTopKOnY; 
    else
        for j=1:size(sortedTopKOnY,1)
            votes(sortedTopKOnY(j),1)=votes(sortedTopKOnY(j),1)+1;
        end
        for l=1:size(votes,1)
            if(max<votes(l))
               max =votes(l);
               EstimatedY(i) = l;
            end
        end
    end
end

error_train=0;
for w = 1:size(Y_train,1)
    if(ne(Y_train(w),EstimatedY(w)))
        error_train = error_train+1;
    end
end
error_train = error_train/size(Y_train,1);
accuracy_train = 1 - error_train;


EstimatedY = zeros(size(Y_test));
for i=1:size(X_test,1)
    max=0;
    votes = zeros(4,1);
    Xi = X_test(i,:);
    repeatXi = repmat(Xi, size(X_train,1), 1);
    distanceX = sqrt(sum((X_train - repeatXi).*(X_train - repeatXi),2));
    [Y, I] = sort(distanceX(:,1));
    sortedY = Y_train(I,:);
    sortedTopKOnY = sortedY(1:k,:);
    
    if(size(sortedTopKOnY, 1) == 1)
        EstimatedY(i) = sortedTopKOnY; 
    else
        for j=1:size(sortedTopKOnY,1)
            votes(sortedTopKOnY(j),1)=votes(sortedTopKOnY(j),1)+1;
        end
        for l=1:size(votes,1)
            if(max<votes(l))
               max =votes(l);
               EstimatedY(i) = l;
            end
        end
    end
end

error_test=0;
for k = 1:size(Y_test,1)
    if(ne(Y_test(k),EstimatedY(k)))
        error_test = error_test+1;
    end
end
error_test = error_test/size(Y_test,1);
accuracy_test = 1 - error_test;
