

fprintf('For eta = 0.001\n')
[costMatrix, cost, theta ] = gradientDescent(0, 0.001, X_train, Y_train, 50)

figure % create new figure
plot(costMatrix)
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Graph of Cross Entropy value vs number of steps for eta = 0.001','fontsize',15)% title
fprintf('L2 norm = ')
norm(theta,2)

fprintf('For eta = 0.01\n')
[costMatrix, cost, theta ] = gradientDescent(0, 0.01, X_train, Y_train, 50)

figure % create new figure
plot(costMatrix)
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Graph of Cross Entropy value vs number of steps for eta = 0.01','fontsize',15)% title
fprintf('L2 norm = ')
norm(theta,2)

fprintf('For eta = 0.05\n')
[costMatrix, cost, theta ] = gradientDescent(0, 0.05, X_train, Y_train, 50)

figure % create new figure
plot(costMatrix)
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Graph of Cross Entropy value vs number of steps for eta = 0.05','fontsize',15)% title
fprintf('L2 norm = ')
norm(theta,2)

fprintf('For eta = 0.1\n')
[costMatrix, cost, theta ] = gradientDescent(0, 0.1, X_train, Y_train, 50)

figure % create new figure
plot(costMatrix)
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Graph of Cross Entropy value vs number of steps for eta = 0.1','fontsize',15)% title
fprintf('L2 norm = ')
norm(theta,2)

fprintf('For eta = 0.5\n')
[costMatrix, cost, theta ] = gradientDescent(0, 0.5, X_train, Y_train, 50)

figure % create new figure
plot(costMatrix)
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Graph of Cross Entropy value vs number of steps for eta = 0.5','fontsize',15)% title
fprintf('L2 norm = ')
norm(theta,2)
