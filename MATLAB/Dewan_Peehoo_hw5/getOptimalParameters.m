function [max_c, max_accuracy, max_rbf_c, max_rbf_gamma, max_rbf_accuracy] = getOptimalParameters(X_cv, X_newTrain, Y_cv, Y_newTrain )
%GETOPTIMALPARAMETERS Summary of this function goes here
%   Detailed explanation goes here

 

C = [10^11 10^10 10^9 10^8 10^7 10^6 10^5 10^4 10^3 10^2 10 1 0.1 0.01 0.001 0.0001];
max_accuracy = 0.0;
max_c = 4^-6;
for j=1:size(C,2)
    options_params = strcat('-t 0',32,'-s 0',32, '-c',32,num2str(C(j)), 32,'-q');
    model = svmtrain(Y_newTrain, X_newTrain, options_params);
    [predict_label_P, accuracy_P, dec_values_P] = svmpredict(Y_cv, X_cv, model);
    if(accuracy_P(1) > max_accuracy)
        max_accuracy = accuracy_P(1);
        max_c = C(j);
    end
end


gamma_values = [10^-14 10^-13 10^-12 10^-11 10^-10 10^-9 10^-8 10^-7 10^-6 10^-5];
max_rbf_accuracy =0.0;
max_rbf_c =0.0;
max_rbf_gamma =10^-9;
for i=1:size(gamma_values,2)
    for j=1:size(C,2)
        options_params = strcat('-t 2',32, '-g',32,num2str(gamma_values(i)),32,'-s 0',32, '-c',32,num2str(C(j)), 32,'-q');
        model = svmtrain(Y_newTrain, X_newTrain, options_params);
        [predict_label_P, accuracy_P, dec_values_P] = svmpredict(Y_cv, X_cv, model);
        if(accuracy_P(1) > max_rbf_accuracy)
            max_rbf_accuracy = accuracy_P(1);
            max_rbf_c = C(j);
            max_rbf_gamma = gamma_values(i);
        end
    end
end


    
                
    
end

