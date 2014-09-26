function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%



pos = find(y==1); 
neg = find(y==-1);
% Plot Examples
plot(X(pos, 1), X(pos, 2),'o', 'MarkerFaceColor', 'r', 'LineWidth', 2, ...
'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), '+', 'MarkerFaceColor', 'b', ...
'MarkerSize', 7);


% Specified in plot order
legend('Class 1', 'Class 2')

%figure; % open a new figure window



% =========================================================================



hold off;

end
