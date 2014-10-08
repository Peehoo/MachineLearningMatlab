function [costMatrix, cost, theta_b, cost_test] = NewtonMethod(numIterations, X_train, Y_train, X_test, Y_test, lambda_1)

lambda = 0.05;
eta = 0.01;
[ costm, cost, theta, b ] = gradientDescent(lambda, eta, X_train, Y_train, 5);
 
% theta_b = [b;theta] ;  
% 
% X_train = [ones(size(X_train,1),1) X_train];
% for i = 1 : numIterations
%     Sig = sigmoid(X_train*theta_b);
% 
%     theta_b = theta_b - ((pinv(X_train'*diag(Sig.*(1-Sig))*X_train)))*X_train'*(Sig-Y_train) + 2*lambda_1*[0;theta_b(2:end)];
%     
%     Sig = sigmoid(X_train*theta_b);
%     %OneMinusSig = 1 - Sig;
%     %OneMinusSig(OneMinusSig<1e-16) = 1e-16;
%     Sig(Sig>1-1e-16) = 1-1e-16;
%     Sig(Sig<1e-16) = 1e-16;
%     
%     cost = - Y_train'*log(Sig) - (1 - Y_train)'*(log(1-Sig)) + lambda_1*norm(theta_b(2:end),2)^2;
%     costMatrix(i) = cost;
% end
% 
theta_b = [b;theta] ;  
identity = eye(size(theta_b,1));
identity(1,1) = 0;

X_train = [ones(size(X_train,1),1) X_train];
X_test = [ones(size(X_test,1),1) X_test];
costMatrix = zeros(numIterations, 1);
for i = 1 : numIterations
    Sig = sigmoid(X_train*theta_b);

    H = X_train'*diag(Sig)*diag(1-Sig)*X_train + lambda_1.*identity;
    theta_b = theta_b - ((pinv(H)))*(X_train'*(Sig-Y_train) + lambda_1*[0;theta_b(2:end)]);
        
    Sig = sigmoid(X_train*theta_b);
    %OneMinusSig = 1 - Sig;
    %OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig>1-1e-16) = 1-1e-16;
    Sig(Sig<1e-16) = 1e-16;
    
    cost = - Y_train'*log(Sig) - (1 - Y_train)'*(log(1-Sig)) + lambda_1*norm(theta_b(2:end),2)^2;
    costMatrix(i) = cost;
end

Sig = sigmoid(X_test*theta_b);
    Sig(Sig>1- 1e-16) = 1 - 1e-16;
    Sig(Sig<1e-16) = 1e-16;
cost_test = -Y_test'*log(Sig) - (1 - Y_test)'*(log(1-Sig)) + lambda_1*norm(theta_b(2:end),2)^2;


