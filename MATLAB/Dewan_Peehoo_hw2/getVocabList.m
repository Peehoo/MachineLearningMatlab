function vocabList = getVocabList()
%GETVOCABLIST reads the fixed vocabulary list in vocab.txt and returns a
%cell array of the words
%   vocabList = GETVOCABLIST() reads the fixed vocabulary list in vocab.txt 
%   and returns a cell array of the words in vocabList.


%% Read the fixed vocabulary list
fid = fopen('spam/vocab.dat');
n=1;
%fid = fopen('fgets.m');

tline = fgets(fid);
while ischar(tline)
    tline = fgets(fid);
    if length(tline) < 1
       continue;
    end

    n = n+1;
    
end

fclose(fid);
vocabList = cell(n, 1);

%% Read the fixed vocabulary list
fid = fopen('spam/vocab.dat');

tline = fgets(fid);
int i=1;
while ischar(tline)
    disp(tline)
    tline = fgets(fid);
    if length(tline) >= 1
        vocabList{i} = tline;
        i=i+1;
    end
end

fclose(fid);

end
