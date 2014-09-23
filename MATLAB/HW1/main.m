clear
[buying_test,maint_test,doors_test,persons_test,lugBoot_test,safety_test,classValue_test] = importdata('car_test.txt', 1, inf);

Buying_test(strcmp (buying_test(:), 'vhigh'), 1) = 1;
Buying_test(strcmp (buying_test(:), 'high'), 2) = 1;
Buying_test(strcmp (buying_test(:), 'med'), 3) = 1;
Buying_test(strcmp (buying_test(:), 'low'), 4) = 1;

Maintainence_test(strcmp (maint_test(:), 'vhigh'), 1) = 1;
Maintainence_test(strcmp (maint_test(:), 'high'), 2) = 1;
Maintainence_test(strcmp (maint_test(:), 'med'), 3) = 1;
Maintainence_test(strcmp (maint_test(:), 'low'), 4) = 1;

Doors_test(strcmp (doors_test(:), '2'), 1) = 1;
Doors_test(strcmp (doors_test(:), '3'), 2) = 1;
Doors_test(strcmp (doors_test(:), '4'), 3) = 1;
Doors_test(strcmp (doors_test(:), '5more'), 4) = 1;

Persons_test(strcmp (persons_test(:), '2'), 1) = 1;
Persons_test(strcmp (persons_test(:), '4'), 2) = 1;
Persons_test(strcmp (persons_test(:), 'more'), 3) = 1;

LugBoot_test(strcmp (lugBoot_test(:), 'small'), 1) = 1;
LugBoot_test(strcmp (lugBoot_test(:), 'med'), 2) = 1;
LugBoot_test(strcmp (lugBoot_test(:), 'big'), 3) = 1;

Safety_test(strcmp (safety_test(:), 'low'), 1) = 1;
Safety_test(strcmp (safety_test(:), 'med'), 2) = 1;
Safety_test(strcmp (safety_test(:), 'high'), 3) = 1;

ClassValues_test(strcmp (classValue_test(:), 'unacc'), 1) = 1;
ClassValues_test(strcmp (classValue_test(:), 'acc'), 2) = 1;
ClassValues_test(strcmp (classValue_test(:), 'good'), 3) = 1;
ClassValues_test(strcmp (classValue_test(:), 'vgood'), 4) = 1;

X_test = [Buying_test Maintainence_test Doors_test Persons_test LugBoot_test Safety_test];
Y_test = ClassValues_test;


[buying_train,maint_train,doors_train,persons_train,lugBoot_train,safety_train,classValue_train] = importdata('car_train.txt', 1, inf);

Buying_train(strcmp (buying_train(:), 'vhigh'), 1) = 1;
Buying_train(strcmp (buying_train(:), 'high'), 2) = 1;
Buying_train(strcmp (buying_train(:), 'med'), 3) = 1;
Buying_train(strcmp (buying_train(:), 'low'), 4) = 1;

Maintainence_train(strcmp (maint_train(:), 'vhigh'), 1) = 1;
Maintainence_train(strcmp (maint_train(:), 'high'), 2) = 1;
Maintainence_train(strcmp (maint_train(:), 'med'), 3) = 1;
Maintainence_train(strcmp (maint_train(:), 'low'), 4) = 1;

Doors_train(strcmp (doors_train(:), '2'), 1) = 1;
Doors_train(strcmp (doors_train(:), '3'), 2) = 1;
Doors_train(strcmp (doors_train(:), '4'), 3) = 1;
Doors_train(strcmp (doors_train(:), '5more'), 4) = 1;

Persons_train(strcmp (persons_train(:), '2'), 1) = 1;
Persons_train(strcmp (persons_train(:), '4'), 2) = 1;
Persons_train(strcmp (persons_train(:), 'more'), 3) = 1;

LugBoot_train(strcmp (lugBoot_train(:), 'small'), 1) = 1;
LugBoot_train(strcmp (lugBoot_train(:), 'med'), 2) = 1;
LugBoot_train(strcmp (lugBoot_train(:), 'big'), 3) = 1;

Safety_train(strcmp (safety_train(:), 'low'), 1) = 1;
Safety_train(strcmp (safety_train(:), 'med'), 2) = 1;
Safety_train(strcmp (safety_train(:), 'high'), 3) = 1;

ClassValues_train(strcmp (classValue_train(:), 'unacc'), 1) = 1;
ClassValues_train(strcmp (classValue_train(:), 'acc'), 2) = 1;
ClassValues_train(strcmp (classValue_train(:), 'good'), 3) = 1;
ClassValues_train(strcmp (classValue_train(:), 'vgood'), 4) = 1;

X_train = [Buying_train Maintainence_train Doors_train Persons_train LugBoot_train Safety_train];
Y_train = ClassValues_train;

[buying_valid,maint_valid,doors_valid,persons_valid,lugBoot_valid,safety_valid,classValue_valid] = importdata('car_valid.txt', 1, inf);

Buying_valid(strcmp (buying_valid(:), 'vhigh'), 1) = 1;
Buying_valid(strcmp (buying_valid(:), 'high'), 2) = 1;
Buying_valid(strcmp (buying_valid(:), 'med'), 3) = 1;
Buying_valid(strcmp (buying_valid(:), 'low'), 4) = 1;

Maintainence_valid(strcmp (maint_valid(:), 'vhigh'), 1) = 1;
Maintainence_valid(strcmp (maint_valid(:), 'high'), 2) = 1;
Maintainence_valid(strcmp (maint_valid(:), 'med'), 3) = 1;
Maintainence_valid(strcmp (maint_valid(:), 'low'), 4) = 1;

Doors_valid(strcmp (doors_valid(:), '2'), 1) = 1;
Doors_valid(strcmp (doors_valid(:), '3'), 2) = 1;
Doors_valid(strcmp (doors_valid(:), '4'), 3) = 1;
Doors_valid(strcmp (doors_valid(:), '5more'), 4) = 1;

Persons_valid(strcmp (persons_valid(:), '2'), 1) = 1;
Persons_valid(strcmp (persons_valid(:), '4'), 2) = 1;
Persons_valid(strcmp (persons_valid(:), 'more'), 3) = 1;

LugBoot_valid(strcmp (lugBoot_valid(:), 'small'), 1) = 1;
LugBoot_valid(strcmp (lugBoot_valid(:), 'med'), 2) = 1;
LugBoot_valid(strcmp (lugBoot_valid(:), 'big'), 3) = 1;

Safety_valid(strcmp (safety_valid(:), 'low'), 1) = 1;
Safety_valid(strcmp (safety_valid(:), 'med'), 2) = 1;
Safety_valid(strcmp (safety_valid(:), 'high'), 3) = 1;

ClassValues_valid(strcmp (classValue_valid(:), 'unacc'), 1) = 1;
ClassValues_valid(strcmp (classValue_valid(:), 'acc'), 2) = 1;
ClassValues_valid(strcmp (classValue_valid(:), 'good'), 3) = 1;
ClassValues_valid(strcmp (classValue_valid(:), 'vgood'), 4) = 1;

X_valid = [Buying_valid Maintainence_valid Doors_valid Persons_valid LugBoot_valid Safety_valid];
Y_valid = ClassValues_valid;

[accuracy_test, accuracy_train] = naive_bayes(X_train, Y_train, X_test, Y_test)
[accuracy_valid, accuracy_train] = naive_bayes(X_train, Y_train, X_valid, Y_valid)


