function [principle_data, feature_columns] = PCA(data, feature_columns, k)

y = data(:,1);
X = data(:,feature_columns);

m = length(y);

%=== Feature Normalise to prevent domination by feature with maximum range ====

[X, mu, sigma] = PCA_featureNormalize(X);

%==============================================================================

Sigma = (1/m)*X'*X;

[U, S, D] = svd(Sigma);

Ureduce = U(:, 1:k);

[variance_retained, k] = calculate_variance(S, k)

z = Ureduce'*X';

principle_data = [y, z'];

feature_columns = [feature_columns(:, 1:k)];

print_correlations(principle_data, feature_columns)

fprintf('Dimentionality Reduction to: %i features\n', size(principle_data, 2)-1)

%===================================================================================

end


function [variance_retained, k] = calculate_variance(S, k)

n = length(S);

numerator = sum_diagonal(S, 1, k);
denominator = sum_diagonal(S, 1, n);

variance_retained = numerator/denominator;

end

function [sum] = sum_diagonal(S, min, max)

sum = 0;
for i=min:max
    sum += S(i, i);
end

end

function print_correlations(data, feature_columns)

for i = feature_columns

    y = data(:,1);
    feature = data(:,i);
    correlation = corr(y, feature);
    
    fprintf('Correlation feature y and PCA feature %i = %f\n', (i-1), correlation)
    
end 

end



