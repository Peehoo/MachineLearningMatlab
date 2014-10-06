lambda = 0.05;
eta = 0.01;
[ costMatrix, cost, theta, b ] = gradientDescent(lambda, eta, X_train, Y_train, 5)

for i = 1 : numIterations
    Sig = sigmoid(b + X_train*theta);
    
    %OneMinusSig = 1 - Sig;
    %OneMinusSig(OneMinusSig<1e-16) = 1e-16;
   
    theta = theta - ((pinv(X_train'*diag(Sig.*(1-Sig))*X_train)))*X_train'*(Sig-Y_train);
    Sig(Sig>1-1e-16) = 1-1e-16;
    Sig(Sig<1e-16) = 1e-16;
    
    cost = - Y_train'*log(Sig) - (1 - Y_train)'*(log(1-Sig)) + lambda*norm(theta,2)^2;
    costMatrix(i) = cost;
end
