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
