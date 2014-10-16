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


negative = train_data.data(train_data.label<0, :);
positive = train_data.data(train_data.label>0, :);

%shuffling
positive = positive(randperm(size(positive,1)), :);
negative = negative(randperm(size(negative,1)), :);



for c = -6:1:2 
    total_accu = 0;
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

        [w,b] = trainsvm(training_sample, training_sample_label, power(4,c));
        accu = testsvm(cv_sample, cv_label, w, b);
        total_accu = total_accu + accu;
        i = i + p_size;
        j = j + n_size;
   end
   avg_accu = total_accu/5;
    fprintf('C= %d and accuracy = %f', c, avg_accu);
    
    
end

