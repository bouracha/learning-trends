function [data] = feature_selection(data);


feature_columns = [2:size(data, 2)];
    
y = data(:,1);
selected_features = [];
for i = feature_columns

    feature = data(:,i);
    correlation = corr(y, feature);
    
    fprintf('\nCorrelation y and feature %i = %f ', (i-1), correlation)
    
   % if (correlation > abs(0.01))
        selected_features = [selected_features, feature];
        %fprintf('Has been selected as a feature')
    %end
    
end     

data = [y, selected_features];
%fprintf('The most correlated feature is %f with correlation of %f\n', i, correlation)

end
