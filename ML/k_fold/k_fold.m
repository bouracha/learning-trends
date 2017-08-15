function [mean_J_CV, mean_J_train, mean_accuracy, mean_positive_precision, mean_positive_recall, mean_negative_precision, mean_negative_recall] = k_fold(k, factor, feature_columns, data)

for i = 1:k
    
    [training_data, CV_data] = splitRandom10(data, factor);
    
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

end

