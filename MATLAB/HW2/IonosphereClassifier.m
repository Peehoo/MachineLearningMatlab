function [ training_accuracy, test_accuracy, cost, theta ] = IonosphereClassifier( lambda, eta )

X_train = getIonosphereX('hw2_data/ionosphere/ionosphere_train.dat', 1, inf);
X_test = getIonosphereX('hw2_data/ionosphere/ionosphere_test.dat', 1, inf);

Y_I = getIonosphereY('hw2_data/ionosphere/ionosphere_train.dat', 1, inf);
Y_train = zeros(size(Y_I));
Y_train(strcmp(Y_I, 'g')==1)=1;


Y_I = getIonosphereY('hw2_data/ionosphere/ionosphere_test.dat', 1, inf);
Y_test = zeros(size(Y_I));
Y_test(strcmp(Y_I, 'g')==1)=1;


lambda = 0.05;
eta  = 0.0001;
[cost, theta] = gradientDescent(lambda, eta, X_train, Y_train);



training_accuracy = cost;

Y_predict = sigmoid(X_test*theta);
Y_predict(Y_predict >0.5) =1;
Y_predict(Y_predict <1) =0;
test_accuracy = 1- sum(abs(Y_predict-Y_test))/size(Y_predict,1);



end

