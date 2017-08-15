clear ; close all; clc

data = csvread('version2.txt');

nRows = size(data,1); % number of rows
nSample = ceil(3*(nRows/10)); % number of samples

rndIDX = randperm(nRows); 

test_data = data(rndIDX(1:nSample), :); 
train_data = data(rndIDX(nSample:nRows), :); 

fprintf('Size of Trainning Set: %f\n', size(train_data, 1));
fprintf('Size of Test Set: %f\n', size(test_data, 1));

save training_data.csv train_data;
save test_data.csv test_data;