clear ; close all; clc
pkg load statistics


%==== Load Data Training, CV, Test ==========================================================

addpath('cost/');
addpath('sigmoid/');

fprintf('\n ###################### \n');

data = load('../data/processed/all.csv');

feature_columns = [2:size(data, 2)];

fprintf('Number of FEATURES: %i\n', size(data, 2)-1)


X = data(:, feature_columns); y = data(:, 1);
 
%============== Train ====================================================

mu = mean(X);
sigma = std(X);

X_norm = (X .- mu)./sigma;

[theta, J] = train(X_norm, y);
J

csvwrite('equation/mu.csv', mu');
csvwrite('equation/sigma.csv', sigma');
csvwrite('equation/theta.csv', theta);

%==========================================================================


