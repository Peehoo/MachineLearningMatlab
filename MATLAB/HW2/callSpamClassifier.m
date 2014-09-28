function [training_accuracy, test_accuracy, cost, theta] = callSpamClassifier(lambda, eta)

vocabList = importVocab('hw2_data/spam/vocab.dat');

[X_train Y_train] = getEmailTrainingMatrix('hw2_data/spam/train', vocabList);
[X_test Y_test] = getEmailTrainingMatrix('hw2_data/spam/test', vocabList);

[S,I] = sort(sum(X_train));
fprintf('Top 3 words are :  ');
vocabList(I(size(I,2)-2:size(I,2)))
fprintf('and their frequencies respectively are : ')
S(size(S,2)-2:size(S,2))


lambda = 0.05;
eta = 0.01;
[cost, theta] = gradientDescent(lambda, eta, X_train, Y_train);



training_accuracy = cost;

Y_predict = sigmoid(X_test*theta);
Y_predict(Y_predict >0.5) =1;
Y_predict(Y_predict <1) =0;
test_accuracy = 1- sum(abs(Y_predict-Y_test))/size(Y_predict,1);