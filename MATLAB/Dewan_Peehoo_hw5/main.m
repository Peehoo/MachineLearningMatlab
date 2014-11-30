clear;
load('face_data.mat');
X=[];

for i=1:size(image, 2)
   A = image{i};
   B = reshape(A, [1 size(A,1)*size(A,2)]);
   X(i,:) = [;B];
end

mean = sum(X)/size(X, 1);
standard_dev = std(X);
mean_matrix = repmat(mean,size(X, 1), 1);
standard_dev_matrix = repmat(standard_dev, size(X,1), 1);
normalized_train_X = (X - mean_matrix)./standard_dev_matrix;

eigenvecs = pca_fun(normalized_train_X, 5);


Z = normalized_train_X*eigenvecs; 
X_rec = Z*eigenvecs';
eI = eigenvecs';
B_max = max(abs(eI(1,:)));

 
%displayData(eI);
 for j=1:size(eI,1)
    figure;
    B_max = max(abs(eI(j,:)));
    colormap(gray);
    imagesc((reshape(eI(j,:), [sqrt(size(eI,2)) sqrt(size(eI,2))])/B_max),[-1 1]);
 end
 
 % add path, required for libsvm
addpath('./libsvm');

setID = [1; 2; 3; 4; 5];
d = [20; 50; 100; 200];
overall_accu = 0;
accuracy_for_each_d = zeros(size(d,1),1);
rbf_accuracy_for_each_d = zeros(size(d,1),1);

parameters = zeros(size(d,1), 3);

for k= 1: size(d,1)
    eigenvecs = pca_fun(normalized_train_X, d(k)); 
    Z = normalized_train_X*eigenvecs;
    overall_accu =0.0, overall_accu_rbf = 0.0;
     for w= 1: size(setID,1);
        Xtrain = Z(subsetID'~=setID(w), :); 
        Xtest = Z(subsetID'==setID(w), :);
        Ytrain = personID(subsetID'~=setID(w))';
        Ytest = personID(subsetID'==setID(w))';
        
        train_subsets = subsetID(:, subsetID'~=setID(w)); 
        max_c = 0.0, max_accuracy = 0.0;
        max_rbf_c = 0.0, max_rbf_gamma = 0.0, max_rbf_accuracy = 0.0;
        for set = 1: size(setID,1)
            if(set == w)
                continue;
            end
            X_cv = Xtrain(train_subsets'==setID(set), :); 
            X_newTrain =  Xtrain(train_subsets'~=setID(set), :);
            Y_cv = Ytrain(train_subsets'==setID(set), :); 
            Y_newTrain = Ytrain(train_subsets'~=setID(set), :);
            [c, cv_accuracy, c_rbf, g_rbf, accuracy_rbf ] = getOptimalParameters(X_cv, X_newTrain, Y_cv, Y_newTrain);
            
            if(cv_accuracy > max_accuracy)
                max_accuracy = cv_accuracy
                max_c = c
            end
            
            if(accuracy_rbf > max_rbf_accuracy)
                max_rbf_accuracy = accuracy_rbf
                max_rbf_c = c_rbf;
                max_rbf_gamma = g_rbf;
            end
        end
        parameters(k, 1) = max_c;
        parameters(k, 2) = max_rbf_c;
        parameters(k, 3) = max_rbf_gamma;
        
        
        options_params = strcat('-t 0',32,'-s 0',32, '-c',32,num2str(max_c), 32,'-q');
        %options_params = strcat('-t 0', 32, '-c 0.001', 32,'-q', 32, '-s 0');
        model= svmtrain(Ytrain, Xtrain, options_params);
        [predict_label_P, accuracy_P, dec_values_P] = svmpredict(Ytest, Xtest, model);
        overall_accu = overall_accu + accuracy_P(1);
        
        options_params = strcat('-t 2',32, '-g',32,num2str(max_rbf_gamma),32,'-s 0',32, '-c',32,num2str(max_rbf_c), 32,'-q');
        model = svmtrain(Ytrain, Xtrain, options_params);
        [predict_label_P, accuracy_P, dec_values_P] = svmpredict(Ytest, Xtest, model);
        overall_accu_rbf = overall_accu_rbf + accuracy_P(1);
     end 
     overall_accu = overall_accu/5;
     accuracy_for_each_d(k,1) = overall_accu
     
     overall_accu_rbf = overall_accu_rbf/5;
     rbf_accuracy_for_each_d(k,1) = overall_accu_rbf
     parameters
end


