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

P_Conditional_on_Y = [sum(X_train(Y_train(:)==1, :))/size((X_train(Y_train(:)==1, :)),1);
                      sum(X_train(Y_train(:)==2, :))/size((X_train(Y_train(:)==2, :)),1);
                      sum(X_train(Y_train(:)==3, :))/size((X_train(Y_train(:)==3, :)),1);
                      sum(X_train(Y_train(:)==4, :))/size((X_train(Y_train(:)==4, :)),1)];
                  
P_Conditional_on_Y(P_Conditional_on_Y==0) = 0.1;
P_Of_Y = [size(Y_train(Y_train(:)==1),1)/size(Y_train, 1) size(Y_train(Y_train(:)==2),1)/size(Y_train, 1) size(Y_train(Y_train(:)==3),1)/size(Y_train, 1) size(Y_train(Y_train(:)==4),1)/size(Y_train, 1)];

EstimatedY = zeros(size(Y_test));
for i = 1:size(X_test,1)
    max = 0;
    for j = 1:4
        Xi = X_test(i,:);
        PConditionOnYj = P_Conditional_on_Y(j,:);
        PConditionOnYj(1, Xi(1,:)==0) = 1 - PConditionOnYj(1,Xi(1,:)==0);
        value = prod(PConditionOnYj)*P_Of_Y(1,j);
        if(max < value)
            max=value;
            EstimatedY(i)=j;
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


EstimatedY = zeros(size(Y_train));
for i = 1:size(X_train,1)
    max = 0;
    for j = 1:4
        Xi = X_train(i,:);
        PConditionOnYj = P_Conditional_on_Y(j,:);
        PConditionOnYj(1,Xi(1,:)==0) = 1 - PConditionOnYj(1,Xi(1,:)==0);
        value = prod(PConditionOnYj)*P_Of_Y(1,j);
        if(max < value)
            max=value;
            EstimatedY(i)=j;
        end
    end
end

error_train=0;
for k = 1:size(Y_train,1)
    if(ne(Y_train(k),EstimatedY(k)))
        error_train = error_train+1;
    end
end
error_train = error_train/size(Y_train,1);
accuracy_train = 1 - error_train;
