Version 1:
############

A 'General' Currency Prediction classifier.

Takes 6 most recent day closing rates for currency exchange and predicts
the confidence with which tomorrow will increase again. (p>0.5) implies
more likely to increase than decrease, (p<0.5) implies decrease more likely.

input.csv handles the input (ie. last 6 days values). Enter the previous 6
days' values in decending order into this file. 
For example, if 
day 1 = 1.0,
day 2 = 1.1,
day 3 = 1.2,
day 4 = 1.3,
day 5 = 1.4,
day 6 = 1.5 (yesterday)

then the file should look like this:

1.5
1.4
1.3
1.2
1.1
1.0

Now finally to run move to the /equation directory with the command line
and then execute the execute the execute.m file by entering 'execute'.

Test Set Results:
##################

Tested on currency pairs: - CHF_AUD
			  - JPY_USD
Sample has 49.896% positive to negative results.

Which is 9,638 datapoints with test accuracy of: 50.685%

On test set:
Positive Precision: 50.434%
Positive Recall: 67.602%
Negative Precision: 51.19%
Negative Recall: 33.837%

#########################################################
Anthony-notes:

NO PCA

All currencies used for train and CV except for tests:
-CHF_AUD
-JPY_USD

Features:
nums = [5,6]
s1, s2, K, diff1, diff2

Hyperparameters:
lambda = 0
Dimentionality Reduction = number of features = N/A
Variance Retained = N/A
Feature Selection restriction = none applied
Training + CV data = 86,742
Ratio Positives/Negatives = 0.50325

CV Results:
###########
PCA Correlations: NO PCA APPLIED AS APPEARED TO GET BETTER WITHOUT

J_train = +/-
J_CV = +/-

CV Accuracy = 50.6 +/- 0.1

CV Positive Precision = 50.7 +/- 0.1
CV Positive Recall = 64 +/- 1.8
CV Negative Precision = 50.4 +/- 0.2 
CV Negative Recall = 37 +/- 2

########################################################