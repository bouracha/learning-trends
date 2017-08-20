function [training_data] = process(filename);

%===== Read in sinlge column Oldest-Newest ====

file = strcat('../data/preprocessed/', filename, '.txt');

data = load(file);

%======= Indice of most recent date =========
%======= Max Indice will exclude most recent 
%======= day as the next day's eval is unknown

max_indice = size(data, 1) - 1;

%======= Min indice will start at indice 30 as
%======= we analyse trends for at least the last
%======= 20 days ===============================

min_indice = 30;

%===============================================

%========== Define set of previous days over =======
%========== over which trends will be calculated ===

nums = [5,6];

%=== Evaluate Features ========================================

features = feature_create(min_indice, max_indice, nums, data);

%=== Return i, data(i), s1_1, s2_1, K_1, firstdiff_1, secondDiff_1, s1_2, s2_2, K_2, ...
%=== ...     , ...    , ... , ... , ...,    ...     ,    ...      , ... , ... , ..., ...
%===================================================================================

%==== Evaluate for Logistic Regression ====

eval = loop_evaluation(min_indice, max_indice, data);

%==== return [i, data(i), evaluation] ==========
%===============================================

%==== Combine Matrices ==============

training_data = matrix_combination(eval, features);


%fprintf('# Slope1_1: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 2)), nanstd(eval_trendlines_diff1s_diffs2(:, 2)))
%fprintf('# Slope1_2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 3)), nanstd(eval_trendlines_diff1s_diffs2(:, 3)))
%fprintf('# Slope2_2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 4)), nanstd(eval_trendlines_diff1s_diffs2(:, 4)))
%fprintf('# Slope1_3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 5)), nanstd(eval_trendlines_diff1s_diffs2(:, 5)))
%fprintf('# Slope2_3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 6)), nanstd(eval_trendlines_diff1s_diffs2(:, 6)))
%fprintf('# Slope1_4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 7)), nanstd(eval_trendlines_diff1s_diffs2(:, 7)))
%fprintf('# Slope2_4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 8)), nanstd(eval_trendlines_diff1s_diffs2(:, 8)))
%fprintf('# Slope1_5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 9)), nanstd(eval_trendlines_diff1s_diffs2(:, 9)))
%fprintf('# Slope2_5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 10)), nanstd(eval_trendlines_diff1s_diffs2(:, 10)))
%fprintf('# diff1: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 11)), nanstd(eval_trendlines_diff1s_diffs2(:, 11)))
%fprintf('# diff2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 12)), nanstd(eval_trendlines_diff1s_diffs2(:, 12)))
%fprintf('# diff3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 13)), nanstd(eval_trendlines_diff1s_diffs2(:, 13)))
%fprintf('# diff4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 14)))
%fprintf('# diff5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 14)))
%fprintf('# diff2_2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 15)))
%fprintf('# diff2_3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 16)))
%fprintf('# diff2_4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 17)))
%fprintf('# diff2_5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 18)))


%====================================

end

