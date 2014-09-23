function [accuracy_test, accuracy_train] = naive_bayes(X_train, Y_train, X_test, Y_test)
% naive bayes classifier
% Input:
%  train_data: N*D matrix, each row as a sample and each column as a
%  feature
%  train_label: N*1 vector, each row as a label
%  new_data: M*D matrix, each row as a sample and each column as a
%  feature
%  new_label: M*1 vector, each row as a label
%
% Output:
%  new_accu: accuracy of classifying new_data
%  train_accu: accuracy of classifying train_data 
%
% CSCI 576 2014 Fall, Homework 1

P_Conditional_on_Y = [sum(X_train(Y_train(:, 1)==1, :))/size(X_train(Y_train(:, 1)==1, :),1);
                      sum(X_train(Y_train(:, 2)==1, :))/size(X_train(Y_train(:, 2)==1, :),1);
                      sum(X_train(Y_train(:, 3)==1, :))/size(X_train(Y_train(:, 3)==1, :),1);
                      sum(X_train(Y_train(:, 4)==1, :))/size(X_train(Y_train(:, 4)==1, :),1)];
                  
P_Conditional_on_Y(P_Conditional_on_Y==0) = 0.1;
P_Of_Y = sum(Y_train)/size(Y_train, 1);

EstimatedY = zeros(size(Y_train));
for i = 1:size(X_train,1)
    for j = 1:size(Y_train,2)
        Xi = X_train(i,:);
        PConditionOnYj = P_Conditional_on_Y(j,:);
        PConditionOnYj(1,Xi(1,:)==0) = 1 - PConditionOnYj(1,Xi(1,:)==0);
        value = prod(PConditionOnYj)*P_Of_Y(1,j);
        EstimatedY(i,j)=value;
    end
    EstimatedY(i, EstimatedY(i,:) == max(EstimatedY(i, :)))=1;
    EstimatedY(i, EstimatedY(i,:) < max(EstimatedY(i, :)))=0;
end
D = Y_train - EstimatedY;
D(D==-1) = 1;
error_train = sum(sum(D))/(2* size(X_train, 1));
accuracy_train = 1 - error_train;


EstimatedY = zeros(size(Y_test));
for i = 1:size(X_test,1)
    for j = 1:size(Y_test,2)
        Xi = X_test(i,:);
        PConditionOnYj = P_Conditional_on_Y(j,:);
        PConditionOnYj(1, Xi(1,:)==0) = 1 - PConditionOnYj(1,Xi(1,:)==0);
        value = prod(PConditionOnYj)*P_Of_Y(1,j);
        EstimatedY(i,j) = value;
    end
    EstimatedY(i, EstimatedY(i,:)==max(EstimatedY(i,:)))=1;
    EstimatedY(i, EstimatedY(i,:) < max(EstimatedY(i,:)))=0;
end
D_test = Y_test - EstimatedY;
D_test(D_test==-1)=1;
error_test = sum(sum(D_test))/(2*size(X_test,1));
accuracy_test = 1 - error_test;
