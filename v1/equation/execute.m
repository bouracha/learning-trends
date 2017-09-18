clear ; close all; clc
pkg load statistics


%==== Load Data Training, CV, Test ==========================================================

addpath('cost/');
addpath('../sigmoid/');

addpath('../../data_preparation/trendline/');
addpath('../../data_preparation/differentials/first_derivatives');
addpath('../../data_preparation/differentials/second_derivatives');
addpath('../../data_preparation/oscillators/');

fprintf('\n ###################### \n');


data_quanta = load('input.csv');

features = [];
nums = [5,6];
for n = nums 
    [s1, s2] = trendline(data_quanta);
    K = oscillator(data_quanta);
    firstdiff = diff1(i, n, data_quanta);
    secondDiff = diff2(i, n, data_quanta);
    features = [features, s1, s2, K, firstdiff, secondDiff];
end

sigma = load('sigma.csv');
mu = load('mu.csv');
theta = load('theta.csv');

X = features;
 
X_norm = (X .- mu')./sigma';
 
X_norm = [ones(size(X_norm, 1), 1)  X_norm];
       
p = sigmoid(X_norm*theta)

%==========================================================================


