function [X_norm, mu, sigma] = PCA_featureNormalize(X)

mu = mean(X);
sigma = std(X);

X_norm = (X .- mu)./sigma;

% ============================================================

end
