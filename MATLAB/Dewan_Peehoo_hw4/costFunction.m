function [mu, labels, costMatrix] = costFunction(X,iter, k)
%COSTFUNCTION Summary of this function goes here
%   Detailed explanation goes here
clear costMatrix;
mu = rand(k,size(X,2)); %initializing the clusters
labels = zeros(size(X,1),1);
cost = zeros(size(X,1),1);
costMatrix = zeros(size(iter,1));

for t = 1:iter
    for i = 1:size(X,1)
      dist = repmat(X(i,:),k,1);
      dist = dist - mu;
      distance = sqrt(sum(dist.^2, 2));
      [value index] = min(distance);
      labels(i) = index;
      cost(i) = value;
    end

    for j = 1:k
        X_temp = X(labels == j, :);
        if(size(X_temp,1) >0)
            mu(j,:) = sum(X_temp)/size(X_temp,1);
        end
    end
    costMatrix(t) = sum(cost);
end

end

