function [iter] = kmeans(X, k)
%KMEANS Summary of this function goes here
%   Detailed explanation goes here
mu = rand(k,size(X,2)); %initializing the clusters

c_previous = ones(size(X,1),1);
c_new = zeros(size(X,1),1);
iter=0;

while(sum(ne(c_previous,c_new)) > 0)
    c_previous = c_new;
    iter = iter+1;
    c_new = zeros(size(X,1),1);
    for i = 1:size(X,1)
      dist = repmat(X(i,:),k,1);
      dist = dist - mu;
      distance = sqrt(sum(dist.^2, 2));
      [value index] = min(distance);
      c_new(i) = index;
    end

    for j = 1:k
        
        X_temp = X(c_new == j, :);
        
        if(size(X_temp,1) >0)
            mu(j,:) = sum(X_temp)/size(X_temp,1)
        end
    end    
end

%plotting data
plotClusters(X, c_new, mu, k);
t = title(sprintf('Clusters, with k = %d', k));
set(t, 'FontSize', 15);


