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
addpath('plots/');

fprintf('\n ###################### \n');

data = load('../data/processed/all.csv');
data_test = load('../data/processed/all_test.csv');

feature_columns = [2:size(data, 2)];

fprintf('Number of FEATURES: %i\n', size(data, 2)-1)


X = data(:, feature_columns); y = data(:, 1);
X_CV = data_test(:, feature_columns); y_CV = data(:, 1);
 
%============== Predict Accuracy with =======================================

[theta, J_train, J_CV] = train(X, y, X_CV, y_CV)

%==========================================================================


