function [mean_J_CV, mean_J_train, mean_accuracy, mean_positive_precision, mean_positive_recall, mean_negative_precision, mean_negative_recall, mean_correlation, mean_variance_retained] = k_fold(k, factor, feature_columns, data,  number_of_dimensions)

for i = 1:k
    
    [training_data, CV_data] = splitRandom10(data, factor);
    
    %[training_data, CV_data, feature_columns, correlations(:,end+1), variance_retained(:,end+1)] = PCA(training_data, CV_data, feature_columns, number_of_dimensions); 
    
    X_train = training_data(:, feature_columns); y = training_data(:, 1);
    X_CV = CV_data(:, feature_columns); y_CV = CV_data(:, 1);

    [theta, mu, sigma, J_train(:, end+1), J_CV(:, end+1), accuracy(:, end+1), positive_precision(:, end+1), positive_recall(:, end+1), negative_precision(:, end+1), negative_recall(:, end+1)] = master(X_train, X_CV, y, y_CV);

end

mean_J_CV = nanmean(J_CV);
mean_J_train = nanmean(J_train);
mean_accuracy = nanmean(accuracy);
mean_positive_precision = nanmean(positive_precision);
mean_positive_recall = nanmean(positive_recall);
mean_negative_precision = nanmean(negative_precision);
mean_negative_recall = nanmean(negative_recall);

correlations = 1;
variance_retained = 1;
mean_correlation = mean(correlations');
mean_variance_retained = mean(variance_retained);

end

