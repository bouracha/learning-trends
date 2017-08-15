function [J, grad] = costFunction(theta, X, y)

m = length(y); 

J = 0;
grad = zeros(size(theta));

J = (1/m)*sum((-y.*log(sigmoid(X*theta)) - (1.-y).*log(1-sigmoid(X*theta))));

alpha = 0.01;
num_fea = size(X, 2);

for i_fea = 1:num_fea
  grad(i_fea) = (1/m)*(sigmoid(X*theta) .- y)'*X(:,i_fea);
end

theta = theta .- alpha*grad;
    


end
