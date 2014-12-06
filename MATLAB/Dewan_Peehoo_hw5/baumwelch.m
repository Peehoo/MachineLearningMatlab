function [A_estimate, E_estimate] = baumwelch(data, A_guess, E_guess, N_iter)
%
% Train Hidden Markov Model using the Baum-Welch algorithm (expectation maximization)
% Input:
%  data: N*T matrix, N data samples of length T
%  A_guess: K*K matrix, where K is the number hidden states [initial guess for the transition matrix]
%  E_guess: K*E matrix, where E is the number of emissions [initial guess for the emission matrix]
%
% Output:
%  A_estimate: estimate for the transition matrix after N_iter iterations of expectation-maximization 
%  E_estimate: estimate for the emission matrix after N_iter iterations of expectation-maximization
%
% CSCI 576 2014 Fall, Homework 5
N = size(data, 1);
T = size(data, 2);
K = size(A_guess, 1); 
pi = zeros(1, K);
pi(1, 1) = 0.1;
pi(1, 2) = 0.9;


for iteration = 1:N_iter
    alpha = zeros(N, T, K);
    beta = zeros(N, T, K);
    gamma = zeros(N, T, K, K);
    delta = zeros(N, T, K);
    for training_sample = 1:N
        for index = 1:T 
            for state = 1:K
                if(index == 1)
                    alpha(training_sample, 1, state) = pi(1, state)*E_guess(state, data(training_sample, index));
                else
                     for t = 1:K
                        alpha(training_sample, index, state) = alpha(training_sample, index, state) + alpha(training_sample, index-1, t)*A_guess(t, state)*E_guess(state, data(training_sample, index));
                     end
                end
            end
        end
    end
    
    for training_sample = 1:N
        for index = T:-1:1 
            for state = 1:K
                if(index == T)
                    beta(training_sample, T, state) = 1;
                else
                     for t = 1:K
                        beta(training_sample, index, state) = beta(training_sample, index, state) + beta(training_sample, index+1, t)*A_guess(state, t)*E_guess(t, data(training_sample, index+1));
                     end
                end
            end
        end
    end
    
    for training_sample = 1:N
        for index = 1:T
            for s = 1:K
                for t = 1:K
                    if(index < T)
                        p = sum(alpha(training_sample, size(alpha,2), :));
                        f = alpha(training_sample, index, s);
                        go = A_guess(s, t);
                        out = E_guess(t, data(training_sample, index+1));
                        b = beta(training_sample, index+1, t); 
                        
                        gamma(training_sample, index, s, t) = (f*go*out*b)/p;
                        delta(training_sample, index, s) = delta(training_sample, index, s) +  gamma(training_sample, index, s, t);
                    else
                        p = sum(alpha(training_sample, size(alpha,2), :));
                        delta(training_sample, T, s) = alpha(training_sample, T, s)/p;
                    end
                end
            end
        end
        
    end
    
    I = zeros(K, 1);
    for s = 1:K
        I(s) = sum(delta(: ,1, s));
    end
    pi = I'/sum(I)
    
    A = zeros(K, K);
    for s = 1:K
        for t = 1:K
            A(s, t) = sum(sum(gamma(:, :, s, t)));
        end
    end
    A_guess = A./repmat(sum(A,2), 1,  size(A,2));
    A_estimate = A_guess;
    
    
   
    E = zeros(size(E_guess));
    
    for s = 1:size(E,1)
        for input = 1:size(E,2)
            [row,col] = find(data(:, :) == input);
            bound =0;
            if(iscolumn(row))
                bound = size(row,1);
            else
                bound = size(row,2);
            end
            for j = 1: bound
                E(s, input) = E(s, input) + delta(row(j), col(j), s);
            end
        end
    end
    E_guess = E./repmat(sum(E,2), 1, size(E,2));
    E_estimate = E_guess;
end