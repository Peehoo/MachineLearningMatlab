function [ cost, theta ] = gradientDescent(lambda, eta, X_train, Y_train )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
b = 0.1;
numIterations = 50;
theta = zeros(size(X_train,2),1);

for i=1:numIterations
    Sig = sigmoid(b + X_train*theta);
   
    OneMinusSig = 1 - Sig;
    OneMinusSig(OneMinusSig<1e-16) = 1e-16;
    Sig(Sig<1e-16) = 1e-16;
    
    theta = theta - eta*(((Sig-Y_train)'*X_train)' + 2*lambda*theta); 
    cost = - Y_train'*log(Sig) - (1 - Y_train)'*(log(OneMinusSig))
end



