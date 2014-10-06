
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

% vocabList = importVocab('hw2_data/spam/vocab.dat');
% 
% [X_train_spam, Y_train_spam] = getEmailTrainingMatrix('hw2_data/spam/train', vocabList);
% [X_test_spam, Y_test_spam] = getEmailTrainingMatrix('hw2_data/spam/test', vocabList);
% 
% fprintf('\nQuestion 5.2 part 1\n');
% [S,I] = sort(sum(X_train_spam));
% fprintf('Top 3 words are :  ');
% vocabList(I(size(I,2)-2:size(I,2)))
% fprintf('and their frequencies respectively are : ')
% S(size(S,2)-2:size(S,2))

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
    hold on;
    l2norm = norm(theta_I,2);
    fprintf('L2 norm = %f\n', l2norm);
    
end


legend(num2str(N(1,1)), num2str(N(1,2)), num2str(N(1,3)), num2str(N(1,4)), num2str(N(1,5)));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Ionosphere Data:Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;

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
    hold on;
    l2norm = norm(theta_S,2);
    fprintf('For eta = %f\n', N(1, i));
    fprintf('   L2 norm = %f\n', l2norm);
    
end


legend(num2str(N(1,1)), num2str(N(1,2)), num2str(N(1,3)), num2str(N(1,4)), num2str(N(1,5)));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Spam Data : Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;



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
    hold on;
    l2norm = norm(theta_I,2);
    fprintf('L2 norm = %f\n', l2norm);
    
end


legend(num2str(N(1,1)), num2str(N(1,2)), num2str(N(1,3)), num2str(N(1,4)), num2str(N(1,5)));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Ionosphere Data: Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;

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
    hold on;
    l2norm = norm(theta_S,2);
    fprintf('L2 norm = %f\n', l2norm);
    
end


legend(num2str(N(1,1)), num2str(N(1,2)), num2str(N(1,3)), num2str(N(1,4)), num2str(N(1,5)));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Number of iterations','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string','Spam Data: Graph of Cross Entropy value vs number of steps for different values of eta','fontsize',15)% title
hold off;


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

% -----------------------------------------------------------------------------------------

fprintf('\nQuestion 5.3 part 4c - Ionosphere data\n');

N = [0.001 0.01 0.05 0.1 0.5];
L = 0:0.05:0.5;
for j= 1:size(N,2)
regularizedCost = zeros(size(L, 2),1);
regularizedCost_test = zeros(size(L, 2),1);
for i= 1:size(L, 2)
   [costMatrix, cost, theta_I ] = gradientDescent(L(1, i), N(1,j), X_train_ionosphere, Y_train_ionosphere, 50);
   regularizedCost(i) = cost;
   [ costMatrix, cost_train, theta, b ] = gradientDescent(L(1, i), N(1, j), X_train_ionosphere, Y_train_ionosphere, 50 );
   Sig = sigmoid(b + X_test_ionosphere*theta);
%    Y_predict_ionospehere = Sig;
%    
%     Y_predict_ionospehere(Y_predict_ionospehere > 0.5) =1;
%     Y_predict_ionospehere(Y_predict_ionospehere < 1) =0;
OneMinusSig = 1 - Sig;
    OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig<1e-16) = 1e-16;
    
    cost = - Y_test_ionosphere'*log(Sig) - (1 - Y_test_ionosphere)'*(log(OneMinusSig)) + L(1, i)*norm(theta,2)^2
    regularizedCost_test(i) = cost;
end
figure % create new figure
plot(L,regularizedCost)



%legend(num2str(N(1,1)), num2str(N(1,2)), num2str(N(1,3)), num2str(N(1,4)), num2str(N(1,5)));
xlhand = get(gca,'xlabel');
set(xlhand,'string','Lambda','fontsize',15)% x-axis label
ylhand = get(gca,'ylabel');
set(ylhand,'string','Cross Entropy Value','fontsize',15)% y-axis label
tlhand = get(gca, 'title');
set(tlhand,'string',strcat('Ionosphere Data: Graph of Cross Entropy value vs lambda for eta = ',num2str(N(1,j))),'fontsize',15)% title
hold on;
plot(L,regularizedCost_test,'g')
end


N = [0.001 0.01 0.05 0.1 0.5];
for j= 1:size(N,2)
    regularizedCost_test = zeros(size(L, 2),1);
    for i= 1:size(L, 2)
    [ costMatrix, cost_train, theta, b ] = gradientDescent(L(1, i), N(1, j), X_train_ionosphere, Y_train_ionosphere, 50 );
    Sig = sigmoid(b + X_test_ionosphere*theta);
    Y_predict_ionospehere = Sig; %This would return a matrix of size(Y_test_ionosphere)

    % Sigmoid returns values between 0 and 1 and so we need to change the values s.t
    % all values greater than 0.5 have prediction 1
    % and all values below 0.5 have prediction 0
    Y_predict_ionospehere(Y_predict_ionospehere > 0.5) =1;
    Y_predict_ionospehere(Y_predict_ionospehere < 1) =0;

    OneMinusSig = 1 - Sig;
    OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig<1e-16) = 1e-16;
    cost = - Y_predict_ionospehere'*log(Sig) - (1 - Y_predict_ionospehere)'*(log(OneMinusSig)) + L(1, i)*norm(theta,2)^2
    regularizedCost_test(i) = cost;
    end
    %figure % create new figure
    plot(L,regularizedCost_test,'g')
end   
   
   
   for i= 1:size(N, 2)
    for j= 1:size(L, 2)
        
    end
end







