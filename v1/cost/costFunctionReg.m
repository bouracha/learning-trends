function [J, grad] = costFunctionReg(theta, X, y, lambda)

m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));


reducedTheta = theta(2:size(theta), :);
J = (1/m)*sum(-y.*log(sigmoid(X*theta)) - (1.-y).*log(1-sigmoid(X*theta))) + (lambda/(2*m))*sum(reducedTheta.^2);

alpha = 0.01;
num_fea = size(X, 2);

grad(1) = (1/m)*(sigmoid(X*theta) .- y)'*X(:,1);
for i_fea = 2:num_fea
  grad(i_fea) = (1/m)*(sigmoid(X*theta) .- y)'*X(:,i_fea) + (lambda/m)*theta(i_fea);
end

%theta = theta .- alpha*grad;

% =============================================================

end
