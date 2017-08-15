function [eval_trendlines_diff1s_diffs2] = process(filename);

%===== Read in sinlge column Oldest-Newest ====

file = strcat('../data/preprocessed/', filename, '.txt');

data = load(file);

%==== Data is Standardised to remove all ==============
%==== generalise trend features such as ===============
%==== how much is a+large rise ========================

data = standardisation(data);

%=== Now a large change, relative to that commodity ===
%=== will have the same value for each commodity ======

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

nums = [1,2,3,4,5];%,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

%========= Make Trendline data ===================

trendlines = loop_trendline(min_indice, max_indice, nums, data);

%== return [i, data(i), s1_nums(1), s2_nums(1), ...
%== returns data from 30 -> max_indice 
%=================================================

%========= Make FD data ===================

diff1s = loop_diff1s(min_indice, max_indice, nums, data);

%== return [i, data(i), ROC_nums(1), ROC_nums(2), ...
%== returns data from 30 -> max_indice 
%=================================================

%========= Make SD data ===================

diff2s = loop_diff2s(min_indice, max_indice, nums, data);

%== return [i, data(i), ratio_nums(2), ROC_nums(3), ...
%== returns data from 30 -> max_indice 
%=================================================

%========= Make Oscillator data ===================

Ks = loop_oscillator(min_indice, max_indice, nums, data);

%== return [i, data(i), K_nums(1), K_nums(2), ...
%== returns data from 30 -> max_indice 
%=================================================

%==== Evaluate for Logistic Regression ====

eval = loop_evaluation(min_indice, max_indice, data);

%==== return [i, data(i), evaluation] ==========
%===============================================

%==== Combine Matrices ==============

eval_trendlines = matrix_combination(eval, trendlines);

eval_trendlines_diff1s = matrix_add(eval_trendlines, diff1s);

eval_trendlines_diff1s_diffs2 = matrix_add(eval_trendlines_diff1s, diff2s);

eval_trendlines_diff1s_diffs2_oscillator = matrix_add(eval_trendlines_diff1s_diffs2, Ks);

fprintf('# Slope1_1: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 2)), nanstd(eval_trendlines_diff1s_diffs2(:, 2)))
fprintf('# Slope1_2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 3)), nanstd(eval_trendlines_diff1s_diffs2(:, 3)))
fprintf('# Slope2_2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 4)), nanstd(eval_trendlines_diff1s_diffs2(:, 4)))
fprintf('# Slope1_3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 5)), nanstd(eval_trendlines_diff1s_diffs2(:, 5)))
fprintf('# Slope2_3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 6)), nanstd(eval_trendlines_diff1s_diffs2(:, 6)))
fprintf('# Slope1_4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 7)), nanstd(eval_trendlines_diff1s_diffs2(:, 7)))
fprintf('# Slope2_4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 8)), nanstd(eval_trendlines_diff1s_diffs2(:, 8)))
fprintf('# Slope1_5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 9)), nanstd(eval_trendlines_diff1s_diffs2(:, 9)))
fprintf('# Slope2_5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 10)), nanstd(eval_trendlines_diff1s_diffs2(:, 10)))
fprintf('# diff1: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 11)), nanstd(eval_trendlines_diff1s_diffs2(:, 11)))
fprintf('# diff2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 12)), nanstd(eval_trendlines_diff1s_diffs2(:, 12)))
fprintf('# diff3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 13)), nanstd(eval_trendlines_diff1s_diffs2(:, 13)))
fprintf('# diff4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 14)))
fprintf('# diff5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 14)))
fprintf('# diff2_2: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 15)))
fprintf('# diff2_3: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 16)))
fprintf('# diff2_4: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 17)))
fprintf('# diff2_5: %f +/- %f #####\n', nanmean(eval_trendlines_diff1s_diffs2(:, 14)), nanstd(eval_trendlines_diff1s_diffs2(:, 18)))


%====================================

end

