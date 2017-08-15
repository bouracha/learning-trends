clear ; close all; clc
pkg load statistics


%==== Load Data Training, CV, Test ==========================================================

addpath('train/cost/');
addpath('randomise/');
addpath('featureNormalize/');
addpath('train/');
addpath('train/mapFeatures/');
addpath('accuracy/');
addpath('sigmoid/');
addpath('k_fold/');

fprintf('\n ###################### \n');

data = load('../data/processed/CHF_AUD.csv');

feature_columns = [2:size(data, 2)];
fprintf('Number of FEATURES: %f\n', size(data, 2))

factor = 1.0;
[training_data, CV_data] = splitRandom10(data, factor);

%==== Learning Curves (argument 'data' as splits to test set itself) ===================

%factor_list = [0.02, 0.05, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.65, 0.8, 0.9, 0.95, 1.0];
%k = 1;
%
%[J_CV, J_train, accuracy] = learning(k, feature_columns, factor_list, data)

%======================================================================================

%============== Predict Accuracy with =======================================

%k = 10;
%factor = 1;

%[J_CV, J_train, accuracy] = k_fold(k, factor, feature_columns, data);

%fprintf('k-fold J_CV: %f\n', J_CV)
%fprintf('k-fold J_train: %f\n', J_train)
%fprintf('k-fold Train Accuracy: %f\n', accuracy)

%==========================================================================

%=========== Calculate Mean and SD of MULTIPLE K-FOLD CROSS VALIDATIONS ===
%============ n-k fold validations =========================================

n = 10;
for i = 1:n

    k = 100;
    factor = 1;
    
    [J_CV(:, end+1), J_train(:, end+1), accuracy(:, end+1), positive_precision(:, end+1), positive_recall(:, end+1), negative_precision(:, end+1), negative_recall(:, end+1)] = k_fold(k, factor, feature_columns, data);

end

fprintf('\n\n');

fprintf('n-k: %f %f \n', n, k)

fprintf('n-k-fold J_CV: %f +/- %f \n', nanmean(J_CV), nanstd(J_CV))
fprintf('n-k-fold J_train: %f +/- %f \n', nanmean(J_train), nanstd(J_train))

fprintf('\n');

fprintf('##############################################################\n');
fprintf('# n-k-fold Train Accuracy: %f +/- %f #####\n', nanmean(accuracy), nanstd(accuracy))
fprintf('##############################################################\n');

fprintf('\n');

fprintf('n-k-fold Positive Precision: %f +/- %f\n', nanmean(positive_precision), nanstd(positive_precision))
fprintf('n-k-fold Positive Recall: %f +/- %f\n', nanmean(positive_recall), nanstd(positive_recall))
fprintf('n-k-fold Negative Precision: %f +/- %f\n', nanmean(negative_precision), nanstd(negative_precision))
fprintf('n-k-fold Negative Recall: %f +/- %f\n', nanmean(negative_recall), nanstd(negative_recall))

%%===========================================================================

%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%