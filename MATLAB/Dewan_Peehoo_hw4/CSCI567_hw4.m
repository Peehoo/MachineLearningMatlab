%loading data
clear;
importData;

X = [x1 x2];

%calling kmeans
kmeans(X, 2);
kmeans(X, 3);
kmeans(X, 5);
hold off;

figure;
hold on;
color = ['r', 'b', 'g', 'm', 'y'];
for p = 1:5
    [mu, labels, costMatrix]= costFunction(X, 50, 4);
    plot(costMatrix, color(p));
    hold on;
end

t = title(sprintf('Objective function for k = 4 for 5 diff initializations in diff colors'));
set(t, 'FontSize', 15);
xlabel('Number of iterations');
ylabel('Value of Objective Function');
legend('init1', 'init2', 'init3', 'init4', 'init5')
hold off;

K = [3; 8; 15];

for k = 1:size(K,1)
    figure;
    picture('hw4.jpg', K(k), 10);
    t = title(sprintf('Image reconstruction for k = %d', K(k)));
    set(t, 'FontSize', 15);
end