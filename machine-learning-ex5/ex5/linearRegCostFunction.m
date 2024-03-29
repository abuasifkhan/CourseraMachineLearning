function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples
n = size(theta,1);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));  % grad(2x1)

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% X(12x2), y(12x1), theta(2x1)

regularizedTheta = [0; theta(2:end)];
hTheta = X * theta; %(12x1)
error = hTheta - y; %(12x1)

squaredError = error.^2;
squaredError = sum(squaredError);
J = (1.0/(2.0*m)) * squaredError;

J = J + (lambda/(2.0*m)) * sum(regularizedTheta.^2);    % Never penalize theta(1)


% for j = 1:n
%     firstTerm = (1/m) * sum( error .* X(:,j) );
%     secondTerm  = (lambda/m) * regularizedTheta(j);
%     grad(j) = firstTerm + secondTerm;
% end

firstTerm = (1/m) * (X' * error);
secondTerm = (lambda/m) * regularizedTheta;
grad = firstTerm + secondTerm;
% =========================================================================

grad = grad(:);
end





