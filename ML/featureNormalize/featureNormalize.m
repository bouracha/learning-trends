function [X_norm_train, mu, sigma, X_norm_CV] = featureNormalize(X_train, X_CV)

mu = mean(X_train);
sigma = std(X_train);

X_norm_train = (X_train .- mu)./sigma;
X_norm_CV = (X_CV .- mu)./sigma;


% ============================================================

end
