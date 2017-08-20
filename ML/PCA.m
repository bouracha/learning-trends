function [principle_data, feature_columns] = PCA(data, feature_columns, number_of_dimensions)

y = data(:,1);
X = data(:,feature_columns);

[COEFF,SCORE,latent,tsquare] = princomp(X);

T = X*COEFF;

principle_data = [y, T(:, 1:number_of_dimensions)];

feature_columns = [feature_columns(:, 1:number_of_dimensions)];

fprintf('Dimentionality Reduction to: %f features\n', size(principle_data, 2)-1)

%===================================================================================

end
