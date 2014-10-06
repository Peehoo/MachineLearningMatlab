function [ costMatrix, cost, theta, b ] = gradientDescent(lambda, eta, X_train, Y_train, numIterations )
% This function is used to calculate the cross entropy by using gradient
% descent

b = 0.1;
theta = zeros(size(X_train,2),1);
costMatrix = zeros(numIterations,1);
Sig = sigmoid(b + X_train*theta);
for i=1:numIterations

    b = b - eta*(sum(Sig-Y_train));
    theta = theta - eta*(((Sig-Y_train)'*X_train)' + 2*lambda*theta); 
    
    Sig = sigmoid(b + X_train*theta);
    %OneMinusSig = 1 - Sig;
    %OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig>1-1e-16) = 1-1e-16;
    Sig(Sig<1e-16) = 1e-16;
    
    cost = - Y_train'*log(Sig) - (1 - Y_train)'*(log(1-Sig)) + lambda*norm(theta,2)^2;
    costMatrix(i) = cost;
end



