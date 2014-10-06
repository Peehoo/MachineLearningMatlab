function features = getFeatureVector(email_contents, vocabList)

% Process file
l = 0;
features = zeros(size(vocabList));
C = strsplit(email_contents, {' ', '.', ',', '?', '\n', '\f', '\r', '\t'});

length = size(C, 2);
for i = 1:length
    str = C(i);
    
    for i = 1:size (vocabList)
        if(strcmpi(vocabList{i}, str) == 1)
            features(i) = features(i) +1;
        end
    end
    
end

