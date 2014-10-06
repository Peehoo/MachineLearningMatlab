function [ test_accuracy, cost, theta ] = IonosphereClassifier( lambda, eta )

X_train = getIonosphereX('hw2_data/ionosphere/ionosphere_train.dat', 1, inf);
X_test = getIonosphereX('hw2_data/ionosphere/ionosphere_test.dat', 1, inf);

Y_I_train = getIonosphereY('hw2_data/ionosphere/ionosphere_train.dat', 1, inf);
Y_train = zeros(size(Y_I_train));
Y_train(strcmp(Y_I_train, 'b')==1)=1;


Y_I_test = getIonosphereY('hw2_data/ionosphere/ionosphere_test.dat', 1, inf);
Y_test = zeros(size(Y_I_test));
Y_test(strcmp(Y_I_test, 'b')==1)=1;


lambda = 0.05;
eta  = 0.0001;
[costMatrix, cost, theta] = gradientDescent(lambda, eta, X_train, Y_train, numIterations);

%training_accuracy = cost;

Y_predict = sigmoid(X_test*theta); %This would return a matrix of size(Y_test)

% Sigmoid returns values between 0 and 1 and so we need to change the values s.t
% all values greater than 0.5 have prediction 1
% and all values below 0.5 have prediction 0
Y_predict(Y_predict > 0.5) =1;
Y_predict(Y_predict < 1) =0;

test_accuracy = 1- sum(abs(Y_predict-Y_test))/size(Y_predict,1);


end

