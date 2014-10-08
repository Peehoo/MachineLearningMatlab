function[X_train_spam, Y_train_spam, X_test_spam, Y_test_spam]  = loadSpamData()
vocabList = importVocab('hw2_data/spam/vocab.dat');

[X_train_spam, Y_train_spam] = getEmailTrainingMatrix('hw2_data/spam/train', vocabList);
[X_test_spam, Y_test_spam] = getEmailTrainingMatrix('hw2_data/spam/test', vocabList);

fprintf('\nQuestion 5.2 part 1\n');
[S,I] = sort(sum(X_train_spam));
fprintf('Top 3 words are :  ');
vocabList(I(size(I,2)-2:size(I,2)))
fprintf('and their frequencies respectively are : ')
S(size(S,2)-2:size(S,2))
