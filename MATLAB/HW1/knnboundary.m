for j = 1:5:20
    X = rand(10000, 2);
    load('boundary.mat');
    EstimatedY = zeros(size(labels));
    for i=1:size(X,1)
        Xi = X(i,:);
        repeatXi = repmat(Xi, size(features,1), 1);
        distanceX = sqrt(sum((features - repeatXi).*(features - repeatXi),2));
        [Y, I] = sort(distanceX(:,1));
        sortedY = labels(I,:);
        sortedTopKOnY = sortedY(1:j,:);

        votes1 = size(sortedTopKOnY(sortedTopKOnY==1), 1)
        votesnot1 = size(sortedTopKOnY(sortedTopKOnY==-1), 1)

        
        if(votes1 > votesnot1)
            EstimatedY(i,:) = 1;
        else
            EstimatedY(i,:) = -1;
        end
    end
    %plotData(X, EstimatedY); 
end


