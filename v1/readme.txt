Version 1:
############

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
Variance Retained = 
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