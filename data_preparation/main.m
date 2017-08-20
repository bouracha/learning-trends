clear ; close all; clc
pkg load statistics

addpath('trendline/');
addpath('evaluation/');
addpath('matrices/');
addpath('differentials/first_derivatives');
addpath('differentials/second_derivatives');
addpath('preprocess/');
addpath('oscillators/');

%===== Read in sinlge column EUR/GBP Oldest-Newest ====

files.CHF_AUD = 'CHF_AUD';
files.EUR_GBP = 'EUR_GBP';
files.GBP_JPY = 'GBP_JPY';
files.JPY_USD = 'JPY_USD';

%data = load('../data/preprocessed/EUR_GBP.txt');
%data = load('data/JPY_USD.txt');
%data = load('data/EUR_CAD.txt');
%data = load('data/JPY_CAD.txt');
%data = load('data/GBP_JPY.txt');

concat_data = [];
concat_path = '../data/processed/'
for [val, key] = files

    %=== Create Features and make Evaluation =========
    
    data = process(val);
    
    %=================================================
    
    %=== Write single processed file =================
    
    path = strcat('../data/processed/', val, '.csv');
    csvwrite(path, data);
    
    %=================================================
    
    %=== Concatnate Matrices and make large datafile =
    
    concat_path = strcat(concat_path, val, '__');
    
    concat_data = [concat_data; data];
    size(concat_data, 1)
    %=================================================
    
end

%=== Concatnated files ============================

concat_path = strcat(concat_path, '.csv');
csvwrite(concat_path, concat_data);

%==================================================


