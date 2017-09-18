clear ; close all; clc
pkg load statistics


%==== Load Data Training, CV, Test ==========================================================

addpath('cost/');
addpath('../sigmoid/');
addpath('../accuracy/');

fprintf('\n ###################### \n');

data = load('../all_test.csv');

sigma = load('sigma.csv')
mu = load('mu.csv')
theta = load('theta.csv')

feature_columns = [2:size(data, 2)];

fprintf('Number of FEATURES: %i\n', size(data, 2)-1)

X = data(:, feature_columns); y = data(:, 1);
 
X_norm = (X .- mu')./sigma';
 
X_norm = [ones(size(X_norm, 1), 1)  X_norm];
       
p = predict(theta, X_norm);
    
accuracy = mean(double(p == y)) * 100

positives_ratio = mean(y)
true_positives = 0;
false_positives = 0;
true_negatives = 0;
false_negatives = 0;
for i = 1:size(y, 1)
  if ((y(i) == 1) && (p(i) == 1))
    true_positives += 1;
  elseif
    ((y(i) == 0) && (p(i) == 1))  
    false_positives += 1;
  elseif
    ((y(i) == 0) && (p(i) == 0))  
    true_negatives += 1;
  elseif
    ((y(i) == 1) && (p(i) == 0))  
    false_negatives += 1;
  end
end

positive_precision = true_positives/(true_positives+false_positives) * 100

positive_recall = true_positives/(true_positives+false_negatives) * 100

negative_precision= true_negatives/(true_negatives+false_negatives) * 100

negative_recall = true_negatives/(true_negatives+false_positives) * 100


%==========================================================================


