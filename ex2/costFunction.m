function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%


h = sigmoid( X*theta );
%vectorialized della simplified cost function
%rif https://share.coursera.org/wiki/index.php/ML:Logistic_Regression
J = (-y' * log(h) - (1-y)' * log(1-h))/m;

%presa dal delta del grad.descent della linear regression:
%delta = (1/m) *  (((X * theta)-y)' * X)'  ;
%simile, ma introduciamo sigmoid:
%Note that while this gradient looks identical to the linear regression gradient, 
%the formula is actually diﬀerent because linear and logistic regression have diﬀerent deﬁnitions of hθ(x)
grad = (1/m) * ((h - y )' * X )';


% =============================================================
%!test
%! X = [ones(3,1) magic(3)];
%! y = [1 0 1]';
%! theta = [-2 -1 1 2]';
%! assert (costFunction(theta, X, y), 4.6832+eps, 2*10^-4)

%!test
%! data = load('ex2data1.txt');
%! X = data(:, [1, 2]); y = data(:, 3);
%! [m, n] = size(X);
%! X = [ones(m, 1) X];
%! initial_theta = zeros(n + 1, 1);
%! [cost, grad] = costFunction(initial_theta, X, y);
%! assert (cost, 0.693+eps , 2*10^-3)


end
