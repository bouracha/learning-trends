function [J] = costFunctionCV(theta, X, y, lambda)

m = length(y); % number of training examples
J = 0;

%=== On Occasion the Prediction value of a class in the =============
%=== Test set will be 0. log(0) = -inf so we must replace ===========
%=== 0 with a very low number so the log is still defined ===========

p_positive = (sigmoid(X*theta));
p_positive(p_positive < 10e-60) = 10e-60;

p_negative = (1-sigmoid(X*theta));
p_negative(p_negative < 10e-60) = 10e-60;

%=== Cost Function ==================================================

reducedTheta = theta(2:size(theta), :);
J = (1/m)*sum(-y.*log(p_positive) - (1.-y).*log(p_negative)) + (lambda/(2*m))*sum(reducedTheta.^2);

% ===================================================================

end
