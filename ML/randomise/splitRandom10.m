function [taining_m, CV_data]  = splitRandom10(X, factor)

nRows = size(X,1); % number of total rows

nCV = ceil(5*(nRows/10)); % number of samples in cross validate set

rndIDX = randperm(nRows);

%=== Fill CV_data and train_data with randomised data ====

CV_data = X(rndIDX(1:nCV), :);  
train_data = X(rndIDX(nCV:nRows), :);

%=========================================================

%=== Select a random subsection of the train data based on factor ====
 
nRows = size(train_data, 1); % number of total rows in training set

msize = ceil(factor*nRows); % number of samples in subset of training data

rndIDX = randperm(nRows); 

taining_m = train_data(rndIDX(1:msize), :);   %the subset m of traing data

%======================================================================



end