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

files.AUD_CAD = 'AUD_CAD';
files.AUD_JPY = 'AUD_JPY';
files.AUD_USD = 'AUD_USD';
files.CAD_USD = 'CAD_USD';
files.CHF_JPY = 'CHF_JPY';
files.CHF_USD = 'CHF_USD';
files.CHF_AUD = 'CHF_AUD';
files.EUR_AUD = 'EUR_AUD';
files.EUR_CAD = 'EUR_CAD';
files.EUR_CHF = 'EUR_CHF';
files.EUR_GBP = 'EUR_GBP';
files.EUR_JPY = 'EUR_JPY';
files.EUR_USD = 'EUR_USD';
files.GBP_AUD = 'GBP_AUD';
files.GBP_CAD = 'GBP_CAD';
files.GBP_CHF = 'GBP_CHF';
files.GBP_JPY = 'GBP_JPY';
files.GBP_USD = 'GBP_USD';
files.JPY_CAD = 'JPY_CAD';
files.JPY_USD = 'JPY_USD';


%data = load('../data/preprocessed/EUR_GBP.txt');
%data = load('data/JPY_USD.txt');
%data = load('data/EUR_CAD.txt');
%data = load('data/JPY_CAD.txt');
%data = load('data/GBP_JPY.txt');

ratios = [];
concat_data = [];
concat_path = '../data/processed/'
for [val, key] = files

    %=== Create Features and make Evaluation =========
    
    [data, ratio_positive_negative] = process(val);
    
    %data = feature_selection(data);
    
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
    
    ratios = [ratios; ratio_positive_negative];
    
end

%=== Concatnated files ============================

overall_ratio_pos_neg = mean(ratios)

%=== Make Feature Evaluation and Selection ========
concat_data = feature_selection(concat_data);
%==================================================

concat_path = strcat(concat_path, '.csv');
csvwrite('../data/processed/all.csv', concat_data);
%csvwrite(concat_path, concat_data);

%==================================================


