%loading data
clear;
importData;

X = [x1 x2];

%calling kmeans
kmeans(X, 2);
kmeans(X, 3);
kmeans(X, 5);
hold off;
color = ['r', 'b', 'g', 'm', 'y'];
for p = 1:5
    [mu, labels, costMatrix]= costFunction(X, 50, 4);
    plot(costMatrix, color(p));
    hold on;
end
hold off;

K = [3; 8; 15];

for k = 1:size(K,1)
    picture('hw4.jpg', K(k), 10);
    figure;
end