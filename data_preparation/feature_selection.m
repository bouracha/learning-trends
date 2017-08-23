function [data] = feature_selection(data);


feature_columns = [2:size(data, 2)];
    
y = data(:,1);
selected_features = [];
for i = feature_columns

    feature = data(:,i);
    correlation = corr(y, feature);
    selected_features = [selected_features, feature];
    
    fprintf('Correlation feature y and feature %i = %f\n', i, correlation)
    
end     

data = [y, selected_features];
%fprintf('The most correlated feature is %f with correlation of %f\n', i, correlation)

end
