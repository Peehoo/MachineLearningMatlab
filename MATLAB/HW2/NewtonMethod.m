lambda = 0.05;
eta = 0.01;
[ costMatrix, cost, theta ] = gradientDescent(lambda, eta, X_train, Y_train, 5)

for i = 1 : numIterations
    Sig = sigmoid(b + X_train*theta);
    
    OneMinusSig = 1 - Sig;
    OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig<1e-16) = 1e-16;
    
    theta = theta - (((pinv(Sig*(1-Sig)'*X_train*X_train'))*(Sig-Y_train))'*X_train)';
    cost = - Y_train'*log(Sig) - (1 - Y_train)'*(log(OneMinusSig));
    costMatrix(i) = cost;
end
