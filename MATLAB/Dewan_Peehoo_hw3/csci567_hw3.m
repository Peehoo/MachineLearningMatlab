[train_data] = load('data_hw3/splice_train.mat');
mean = sum(train_data.data)/size(train_data.data, 1);
standard_dev = std(train_data.data);
mean_matrix = repmat(mean,size(train_data.data, 1), 1);
standard_dev_matrix = repmat(standard_dev, size(train_data.data,1), 1);
normalized_train_X = (train_data.data - mean_matrix)./standard_dev_matrix;
normalized_train_Y = train_data.label;

clear mean_matrix standard_dev_matrix;

[test_data] = load('data_hw3/splice_test.mat');
mean_matrix = repmat(mean,size(test_data.data, 1), 1);
standard_dev_matrix = repmat(standard_dev, size(test_data.data,1), 1);
normalized_test_X = (test_data.data - mean_matrix)./standard_dev_matrix;
normalized_test_Y = test_data.label;


negative = normalized_train_X(train_data.label<0, :);
positive = normalized_train_X(train_data.label>0, :);

%seeding
rng(18);
%shuffling
positive = positive(randperm(size(positive,1)), :);
negative = negative(randperm(size(negative,1)), :);



for c = -6:1:2 
    total_accu = 0;
    total_time = 0;
    p_size = floor(size(positive, 1)/5);
    n_size = ceil(size(negative, 1)/5);
    i=1; j=1;
    
   for k = 1:5
       
        p_index = min(k*p_size, size(positive, 1));
        n_index = min(k*n_size, size(negative, 1));

        cv_sample = [positive(i:p_index, :);  negative(j:n_index, :)];
        training_sample = [positive(1:i-1,:) ; positive(p_index + 1:size(positive,1),:); negative(1:j-1,:) ; negative(n_index + 1:size(negative,1),:)];
        cv_label = [ones(p_index - i +1,1); (-1)*ones(n_index - j +1,1)] ;
        training_sample_label = [ones(i-1,1) ; ones(size(positive,1) - p_index,1) ; (-1)*ones(j-1,1) ; (-1)*ones(size(negative,1) - n_index,1)];
        
        tic
        [w,b] = trainsvm(training_sample, training_sample_label, power(4,c));
        total_time = total_time + toc;
        
        accu = testsvm(cv_sample, cv_label, w, b);
        total_accu = total_accu + accu;
        
        i = i + p_size;
        j = j + n_size;
   end
   avg_accu = total_accu/5;
   avg_time = total_time/5;
   fprintf('C= %d and accuracy = %f and time = %f \n', power(4,c), avg_accu, avg_time);
end




% add path, required for libsvm
addpath('/Users/kunaltaneja/Downloads/libsvm-3.18/matlab');

%Linear SVM using LIBSVM
C = [4^-6 4^-5 4^-4 4^-3 4^-2 4^-1 1 4^1 4^2];


accuracyTime_matrix = zeros(size(C,2),2);
for j=1:size(C,2)
    options_params = strcat('-t 0',32,'-v 5',32, '-c',32,num2str(C(j)), 32,'-q');

    tic;
    accu= svmtrain(train_data.label, normalized_train_X, options_params);
    time = toc;

    accuracyTime_matrix(j,:) = [accu time/5];
end
fprintf('accuracy time matrix for Linear SVM');
accuracyTime_matrix




%Kernel SVM using LIBSVM
d = [1 2 3];
C = [4^-4 4^-3 4^-2 4^-1 1 4^1 4^2 4^3 4^4 4^5 4^6 4^7];

for i=1:size(d,2)
    accuracyTime_matrix = zeros(size(C,2),2);
    for j=1:size(C,2)
        options_params = strcat('-t 1',32, '-d',32,num2str(d(i)),32,'-v 5',32, '-c',32,num2str(C(j)), 32,'-q');
        
        tic;
        accu= svmtrain(train_data.label, normalized_train_X, options_params);
        time = toc;
        
        accuracyTime_matrix(j,:) = [accu time/5];
    end
    fprintf('accuracy time matrix for d = %d',d(i));
    accuracyTime_matrix
end






%RBF kernel
gamma_values = [4^-7 4^-6 4^-5 4^-4 4^-3 4^-2 4^-1];
C = [4^-4 4^-3 4^-2 4^-1 1 4^1 4^2 4^3 4^4 4^5 4^6 4^7];

for i=1:size(gamma_values,2)
    accuracyTime_matrix = zeros(size(C,2),2);
    for j=1:size(C,2)
        options_params = strcat('-t 2',32, '-g',32,num2str(gamma_values(i)),32,'-v 5',32, '-c',32,num2str(C(j)), 32,'-q');
        
        tic;
        accu= svmtrain(train_data.label, normalized_train_X, options_params);
        time = toc;
        
        accuracyTime_matrix(j,:) = [accu time/5];
    end
    fprintf('accuracy time matrix for gamma = %d',gamma_values(i));
    accuracyTime_matrix
end



%test accuracy
options_params = strcat('-t 2',32, '-g',32,num2str(4^-3),32, '-c',32,num2str(4), 32,'-q');
model_precomputed = svmtrain(normalized_train_Y, normalized_train_X, options_params);
[predict_label_P, accuracy_P, dec_values_P] = svmpredict(normalized_test_Y, normalized_test_X, model_precomputed);