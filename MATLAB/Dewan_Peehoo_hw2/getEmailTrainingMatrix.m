function [X_train Y_train] = getEmailTrainingMatrix(trainingDirectory, vocabList)

spamTrainingDirectory = strcat(trainingDirectory, '/spam');

listing = dir(spamTrainingDirectory);
X_train = zeros(1, size(vocabList,1));
Y_train = zeros(1, 1);
row=1;
for i=1:size(listing,1)
    if((strcmp(listing(i).name, '.'))==0)
        if((strcmp(listing(i).name, '..'))==0)
            nameOfFile = strcat(spamTrainingDirectory, '/' , listing(i).name);
            email_contents = readFile(nameOfFile);
            features = getFeatureVector(email_contents, vocabList);
            X_train(row, :) = features;
            Y_train(row, :) = 1;
            row = row +1;
        end
    end
end



hamTrainingDirectory = strcat(trainingDirectory, '/ham');

listing = dir(hamTrainingDirectory);
for j=1:size(listing,1)
    if((strcmp(listing(j).name, '.'))==0)
        if((strcmp(listing(j).name, '..'))==0)
            nameOfFile = strcat(hamTrainingDirectory, '/' , listing(j).name); 
            email_contents = readFile(nameOfFile);
            features = getFeatureVector(email_contents, vocabList);
            X_train(row, :) = features;
            Y_train(row, :) = 0;
            row = row +1;
        end
    end
end