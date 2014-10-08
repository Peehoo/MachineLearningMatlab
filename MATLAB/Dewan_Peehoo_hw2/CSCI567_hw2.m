
fprintf('Loading Ionosphare Data..\n');
X_train_ionosphere = getIonosphereX('hw2_data/ionosphere/ionosphere_train.dat', 1, inf);
X_test_ionosphere = getIonosphereX('hw2_data/ionosphere/ionosphere_test.dat', 1, inf);

Y_I_train_ionosphere = getIonosphereY('hw2_data/ionosphere/ionosphere_train.dat', 1, inf);
Y_train_ionosphere = zeros(size(Y_I_train_ionosphere));
Y_train_ionosphere(strcmp(Y_I_train_ionosphere, 'b')==1)=1;


Y_I_test_ionosphere = getIonosphereY('hw2_data/ionosphere/ionosphere_test.dat', 1, inf);
Y_test_ionosphere = zeros(size(Y_I_test_ionosphere));
Y_test_ionosphere(strcmp(Y_I_test_ionosphere, 'b')==1)=1;

fprintf('\n Loading Spam Data...\n');
fprintf('This may take a few minutes......\n');

[X_train_spam, Y_train_spam, X_test_spam, Y_test_spam] = loadSpamData();

% -----------------------------------------------------------------------------------------
% 5.3 part 3(a) - Ionosphere data
N = [0.001 0.01 0.05 0.1 0.5];
figure % create new figure
Color = ['b' 'g' 'r' 'c' 'm'];
lambda=0.0;
fprintf('\nQuestion 5.3 part 3a\n');
for i= 1:size(N, 2)
    fprintf('\nRunning Gradient descent for Ionosphere Data for eta = %f\n', N(1, i));
    [costMatrix, cost, theta_I ] = gradientDescent(lambda, N(1,i), X_train_ionosphere, Y_train_ionosphere, 50);
    plot(costMatrix, Color(i))
    hold on;
    l2norm = norm(theta_I,2);
    fprintf('L2 norm = %f\n', l2norm);
    
end


legend(strcat('eta = ',num2str(N(1,1))), strcat('eta = ',num2str(N(1,2))), strcat('eta = ',num2str(N(1,3))), strcat('eta = ',num2str(N(1,4))), strcat('eta = ',num2str(N(1,5))));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Ionosphere Data:Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;
clear costMatrix cost theta_I

% -----------------------------------------------------------------------------------------
%5.3 part 3(a) - Spam data
N = [0.001 0.01 0.05 0.1 0.5];
figure % create new figure
Color = ['b' 'g' 'r' 'c' 'm'];
lambda=0.0;
fprintf('\nQuestion 5.3 part 3a\n');
fprintf('\nRunning Gradient descent for Spam Data');
for i= 1:size(N, 2)
    [costMatrix, cost, theta_S ] = gradientDescent(lambda, N(1,i), X_train_spam, Y_train_spam, 50);
    plot(costMatrix, Color(i))
    hold on;
    l2norm = norm(theta_S,2);
    fprintf('For eta = %f\n', N(1, i));
    fprintf('   L2 norm = %f\n', l2norm);
    
end


legend(strcat('eta = ',num2str(N(1,1))), strcat('eta = ',num2str(N(1,2))), strcat('eta = ',num2str(N(1,3))), strcat('eta = ',num2str(N(1,4))), strcat('eta = ',num2str(N(1,5))));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Spam Data : Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;

clear costMatrix cost theta_S

% -----------------------------------------------------------------------------------------
fprintf('\nQuestion 5.3 part 4a - Ionosphere data\n');

figure % create new figure
Color = ['b' 'g' 'r' 'c' 'm'];
lambda=0.1;
N = [0.001 0.01 0.05 0.1 0.5];
for i= 1:size(N, 2)
    fprintf('\nRunning Gradient descent for Ionosphere Data for eta = %f\n', N(1, i));
    %fprintf('For eta = %f\n', N(1, i));
    [costMatrix, cost, theta_I ] = gradientDescent(lambda, N(1,i), X_train_ionosphere, Y_train_ionosphere, 50);
    plot(costMatrix, Color(i))
    hold on;
    l2norm = norm(theta_I,2);
    fprintf('L2 norm = %f\n', l2norm);
    
end


legend(strcat('eta = ',num2str(N(1,1))), strcat('eta = ',num2str(N(1,2))), strcat('eta = ',num2str(N(1,3))), strcat('eta = ',num2str(N(1,4))), strcat('eta = ',num2str(N(1,5))));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Ionosphere Data: Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;
clear costMatrix cost theta_I

% -----------------------------------------------------------------------------------------
fprintf('\nQuestion 5.3 part 4a - Spam data\n');

figure % create new figure
Color = ['b' 'g' 'r' 'c' 'm'];
lambda=0.1;
for i= 1:size(N, 2)
    fprintf('\nRunning Gradient descent for Spam Data for eta = %f\n', N(1, i));
    [costMatrix, cost, theta_S ] = gradientDescent(lambda, N(1,i), X_train_spam, Y_train_spam, 50);
    plot(costMatrix, Color(i))
    hold on;
    l2norm = norm(theta_S,2);
    fprintf('L2 norm = %f\n', l2norm);
    
end

legend(strcat('eta = ',num2str(N(1,1))), strcat('eta = ',num2str(N(1,2))), strcat('eta = ',num2str(N(1,3))), strcat('eta = ',num2str(N(1,4))), strcat('eta = ',num2str(N(1,5))));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Spam Data: Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;

clear costMatrix cost theta_S
% -----------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 4b - Ionosphere data\n');
L = 0:0.05:0.5;
eta = 0.01;
for i= 1:size(L, 2)
    fprintf('Running Gradient descent for Ionosphere Data for lambda = %f\n', L(1,i));
    [costMatrix, cost, theta_I ] = gradientDescent(L(1, i), eta, X_train_ionosphere, Y_train_ionosphere, 50);
    l2norm = norm(theta_I,2);
    fprintf('L2 norm = %f\n', l2norm);
end
clear costMatrix cost theta_I

% -----------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 4b - Spam data\n');
L = 0:0.05:0.5;
eta = 0.01;
for i= 1:size(L, 2)
    fprintf('Running Gradient descent for Spam Data for lambda = %f\n', L(1,i));
    [costMatrix, cost, theta_S ] = gradientDescent(L(1, i), eta, X_train_spam, Y_train_spam, 50);
    l2norm = norm(theta_S,2);
    fprintf('L2 norm = %f\n', l2norm);
end
clear costMatrix cost theta_S
% -----------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 4c - Ionosphere data\n');

N = [0.001 0.01 0.05 0.1 0.5];
L = 0:0.05:0.5;
for j= 1:size(N,2)
regularizedCost = zeros(size(L, 2),1);
regularizedCost_test = zeros(size(L, 2),1);
for i= 1:size(L, 2)
    [costMatrix, cost_train, theta, b ] = gradientDescent(L(1, i), N(1, j), X_train_ionosphere, Y_train_ionosphere, 50 );
    regularizedCost(i) = cost_train;
    l2norm = norm(theta,2);
    fprintf('L2 norm = %f\n', l2norm);
    Sig = sigmoid(b + X_test_ionosphere*theta);
    
    OneMinusSig = 1 - Sig;
    OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig<1e-16) = 1e-16;

    cost = - Y_test_ionosphere'*log(Sig) - (1 - Y_test_ionosphere)'*(log(OneMinusSig)) + L(1, i)*norm(theta,2)^2
    regularizedCost_test(i) = cost;
end
figure % create new figure
plot(L,regularizedCost)

xlhand = get(gca,'xlabel');
set(xlhand,'string','Lambda','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string',strcat('Ionosphere Data: Graph of Cross Entropy value vs lambda for eta = ',num2str(N(1,j))),'fontsize',15)% title
hold on;
plot(L,regularizedCost_test,'g')
legend({'Training Set','Testing Set'},'FontSize',10,'FontWeight','bold')
hold off;
end
clear cost_train theta b Sig OneMinusSig regularizedCost regularizedCost_test cost

% -----------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 4c - Spam data\n');

N = [0.001 0.01 0.05 0.1 0.5];
L = 0:0.05:0.5;
for j= 1:1
regularizedCost = zeros(size(L, 2),1);
regularizedCost_test = zeros(size(L, 2),1);
for i= 1:size(L, 2)
    [costMatrix, cost_train, theta, b ] = gradientDescent(L(1, i), N(1, j), X_train_spam, Y_train_spam, 50 );
    regularizedCost(i) = cost_train;
    l2norm = norm(theta,2);
    fprintf('L2 norm = %f\n', l2norm);
    
    Sig = sigmoid(b + X_test_spam*theta);
    Sig(Sig>1- 1e-16) = 1 - 1e-16;
    Sig(Sig<1e-16) = 1e-16;

    cost = - Y_test_spam'*log(Sig) - (1 - Y_test_spam)'*(log(1 - Sig)) + L(1, i)*norm(theta,2)^2
    regularizedCost_test(i) = cost;
end
figure % create new figure
plot(L,regularizedCost)
xlhand = get(gca,'xlabel');
set(xlhand,'string','Lambda','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string',strcat('Ionosphere Data: Graph of Cross Entropy value vs lambda for eta = ',num2str(N(1,j))),'fontsize',15)% title
hold on;
plot(L,regularizedCost_test,'g')
legend({'Training Set','Testing Set'},'FontSize',10,'FontWeight','bold')
hold off;
end

clear cost_train theta b Sig OneMinusSig regularizedCost regularizedCost_test cost

%---------------------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 6 - Ionosphere data\n');
[costMatrix, cost, theta, cost_test] = NewtonMethod(50, X_train_ionosphere, Y_train_ionosphere, X_test_ionosphere, Y_test_ionosphere, 0);

figure % create new figure
plot(costMatrix)

xlhand = get(gca,'xlabel');
set(xlhand,'string','number of Iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string',strcat('Ionosphere Data: Graph of Cross Entropy value vs number of iterations'),'fontsize',15)% title
l2norm = norm(theta(2:end),2);
fprintf('L2 norm = %f\n', l2norm);
fprintf('cross entropy for Ionospere test - %f\n',cost_test);
clear costMatrix cost theta cost_test

%---------------------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 6 - Spam data\n');
[costMatrix, cost, theta, cost_test] = NewtonMethod(50, X_train_spam, Y_train_spam, X_test_spam, Y_test_spam, 0);

figure % create new figure
plot(costMatrix)

xlhand = get(gca,'xlabel');
set(xlhand,'string','number of Iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string',strcat('Spam Data: Graph of Cross Entropy value vs number of iterations'),'fontsize',15)% title
l2norm = norm(theta(2:end),2);
fprintf('L2 norm = %f\n', l2norm);
fprintf('cross entropy for Spam test - %f\n',cost_test);
clear costMatrix cost theta cost_test

%---------------------------------------------------------------------------------------------------


L = 0:0.05:0.5;
figure % create new figure
Color = ['b' 'g' 'r' 'c' 'm' 'y' 'k' 'w' '[1,0.4,0.6]' '[1,0.4,0.8]'];
for i = 1:size(L,2)
    [costMatrix, cost, theta, cost_test] = NewtonMethod(50, X_train_ionosphere, Y_train_ionosphere, X_test_ionosphere, Y_test_ionosphere, L(1,i));
    l2norm = norm(theta(2:end),2);
fprintf('L2 norm = %f\n', l2norm);
fprintf('cross entropy for Ionospere test - %f\n',cost_test);
    h= plot(costMatrix);
    R = rand(1, 3)
    set(h,'Color',R)
    clear costMatrix cost theta cost_test
    hold on;
end
legend(strcat('lambda = ','0.05'), strcat('lambda = ','0.1'), strcat('lambda = ','0.15'), strcat('lambda = ','0.2'), strcat('eta = ', '0.25'), strcat('lambda = ','0.3'), strcat('lambda = ','0.35'), strcat('lambda = ','0.4'), strcat('lambda = ','0.45'), strcat('lambda = ','0.5'));
xlhand = get(gca,'xlabel');
set(xlhand,'string','number of Iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Ionosphere Data:Graph of Cross Entropy value vs number of iterations for different values of lambda','fontsize',15)% title
hold off;



%---------------------------------------------------------------------------------------------------
L = 0:0.05:0.5;
figure % create new figure
Color = ['b' 'g' 'r' 'c' 'm' 'y' 'k' 'w' '[1,0.4,0.6]' '[1,0.4,0.8]'];
for i = 1:size(L,2)
    [costMatrix, cost, theta, cost_test] = NewtonMethod(50, X_train_spam, Y_train_spam, X_test_spam, Y_test_spam, L(1,i));
        l2norm = norm(theta(2:end),2);
fprintf('L2 norm = %f\n', l2norm);
fprintf('cross entropy for Spam test - %f\n',cost_test);
    h= plot(costMatrix);
    R = rand(1, 3);
    set(h,'Color',R)
    clear costMatrix cost theta cost_test
    hold on;
end
legend(strcat('lambda = ','0.05'), strcat('lambda = ','0.1'), strcat('lambda = ','0.15'), strcat('lambda = ','0.2'), strcat('eta = ', '0.25'), strcat('lambda = ','0.3'), strcat('lambda = ','0.35'), strcat('lambda = ','0.4'), strcat('lambda = ','0.45'), strcat('lambda = ','0.5'));
xlhand = get(gca,'xlabel');
set(xlhand,'string','number of Iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Ionosphere Data:Graph of Cross Entropy value vs number of iterations for different values of lambda','fontsize',15)% title
hold off;
