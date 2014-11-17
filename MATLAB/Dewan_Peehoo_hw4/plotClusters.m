function plotClusters(X, idx, mu, K)

% Generate colours
palette = hsv(K);
colours = palette(idx, :);

% Plot the data
figure;
scatter(X(:,1), X(:,2), 15, colours);
hold on;
scatter(mu(:,1), mu(:,2), 50, 'O', 'filled', 'black')
end
