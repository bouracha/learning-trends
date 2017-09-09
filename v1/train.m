function [theta, J_train, J_CV] = train(X, y, X_CV, y_CV)

X = mapFeatureLinear(X);
X_CV = mapFeatureLinear(X_CV);


initial_theta = zeros(size(X, 2), 1);


%========== Training ==========================================
lambda = 0;
%==== Use fminuc, or Gradient Decent =====

[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

options = optimset('GradObj', 'on', 'MaxIter', 1000);
[theta, J, exit_flag] = fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

%==== Gradient Decent ====================

#[theta] = gradientDecent(X, y, lambda, initial_theta);

%==========================================
%====== Print Values After Training ============================

[J_train, grad] = costFunctionReg(theta, X, y, lambda);

[J_CV] = costFunctionCV(theta, X_CV, y_CV, lambda);

%================================================================


end

