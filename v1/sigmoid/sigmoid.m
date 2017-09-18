function g = sigmoid(z)
%SIGMOID Compute sigmoid functoon

g = zeros(size(z));

% ====================== YOUR CODE HERE ======================

g = 1./(1+e.^(-z));

% =============================================================

end
