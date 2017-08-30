function [principle_train_data, principle_CV_data, feature_columns, correlations, variance_retained] = PCA(training_data, CV_data, feature_columns, k)

y = training_data(:,1);
X = training_data(:,feature_columns);

y_CV = CV_data(:,1);
X_CV = CV_data(:,feature_columns);

m = length(y);

%=== Feature Normalise to prevent domination by feature with maximum range ====

[X, mu, sigma] = PCA_featureNormalize(X);

%==============================================================================

Sigma = (1/m)*X'*X;

[U, S, D] = svd(Sigma);

Ureduce = U(:, 1:k);

[variance_retained, k] = calculate_variance(S, k)

z_train = Ureduce'*X';
z_CV = Ureduce'*X_CV';

principle_train_data = [y, z_train'];
principle_CV_data = [y_CV, z_CV'];

feature_columns = [feature_columns(:, 1:k)];

[correlations] = calculate_correlations(principle_train_data, feature_columns)

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

function [correlations] = calculate_correlations(data, feature_columns)

correlations = [];
for i = feature_columns

    y = data(:,1);
    feature = data(:,i);
    correlation = corr(y, feature);
    
    correlations = [correlations; correlation];
    
end 

end



