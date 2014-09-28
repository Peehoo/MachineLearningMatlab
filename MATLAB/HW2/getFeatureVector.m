function features = getFeatureVector(email_contents, vocabList)

% Process file
l = 0;
features = zeros(size(vocabList));
C = strsplit(email_contents, {' ', '.', ',', '?', '\n', '\f', '\r', '\t'});

length = size(C, 2);
for i = 1:length
    str = C(i);
    
    for i = 1:size (vocabList)
        if(strcmp(vocabList{i}, str) == 1)
            features(i) = features(i) +1;
        end
    end
    
end
% while ~isempty(email_contents)
% 
%     % Tokenize and also get rid of any punctuation
%     [str, email_contents] = strtok(email_contents, [' .?,\f\n\r\t\v' char(13)]);
%     
%     % Skip the word if it is too short
%     if length(str) < 1
%        continue;
%     end
% 
%     % Look up the word in the dictionary and add to word_indices if
%     % found
%     % ====================== YOUR CODE HERE ======================
%     % Instructions: Fill in this function to add the index of str to
%     %               word_indices if it is in the vocabulary. At this point
%     %               of the code, you have a stemmed word from the email in
%     %               the variable str. You should look up str in the
%     %               vocabulary list (vocabList). If a match exists, you
%     %               should add the index of the word to the word_indices
%     %               vector. Concretely, if str = 'action', then you should
%     %               look up the vocabulary list to find where in vocabList
%     %               'action' appears. For example, if vocabList{18} =
%     %               'action', then, you should add 18 to the word_indices 
%     %               vector (e.g., word_indices = [word_indices ; 18]; ).
%     % 
%     % Note: vocabList{idx} returns a the word with index idx in the
%     %       vocabulary list.
%     % 
%     % Note: You can use strcmp(str1, str2) to compare two strings (str1 and
%     %       str2). It will return 1 only if the two strings are equivalent.
%     %
% 
% 
%     
%     for i = 1:size (vocabList)
%         if(strcmp(vocabList{i}, str) == 1)
%             features(i) = features(i) +1;
%         end
%     end
% 
%     % =============================================================
% 
% 
%     % Print to screen, ensuring that the output lines are not too long
%     if (l + length(str) + 1) > 78
%         l = 0;
%     end
%     l = l + length(str) + 1;
% 
% end
