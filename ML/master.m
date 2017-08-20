function [theta, mu, sigma, J_train, J_CV, accuracy, positive_precision, positive_recall, negative_precision, negative_recall] = master(X_train, X_CV, y, y_CV)

%====== Feature Normalise ===================================================================

[X_norm_train, mu, sigma, X_norm_CV] = featureNormalize(X_train, X_CV);

%============================================================================================


%=== Train ==================================================================================


[theta, J_train, J_CV] =  train(X_norm_train, y, X_norm_CV, y_CV);
 
 
%============================== Predict Train Accuracy ===================

X_norm_CV = [ones(size(X_norm_CV, 1), 1)  X_norm_CV];
       
p = predict(theta, X_norm_CV);
    
accuracy = mean(double(p == y_CV)) * 100;

true_positives = 0;
false_positives = 0;
true_negatives = 0;
false_negatives = 0;
for i = 1:size(y_CV, 1)
  if ((y_CV(i) == 1) && (p(i) == 1))
    true_positives += 1;
  elseif
    ((y_CV(i) == 0) && (p(i) == 1))  
    false_positives += 1;
  elseif
    ((y_CV(i) == 0) && (p(i) == 0))  
    true_negatives += 1;
  elseif
    ((y_CV(i) == 1) && (p(i) == 0))  
    false_negatives += 1;
  end
end

positive_precision = true_positives/(true_positives+false_positives) * 100;

positive_recall = true_positives/(true_positives+false_negatives) * 100;

negative_precision= true_negatives/(true_negatives+false_negatives) * 100;

negative_recall = true_negatives/(true_negatives+false_positives) * 100;

%plotDecisionBoundary(theta, X_norm_CV, y_CV)

%fprintf('Train Accuracy: %f\n', accuracy)

%===================================================================================

