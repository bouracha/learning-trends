function [J_CV, J_train, accuracy] = learning(k, feature_columns, factor_list, data)



for factor = factor_list
    
    [J_CV(:, end+1), J_train(:, end+1), accuracy(:, end+1)] = k_fold(k, factor, feature_columns, data);

end


%==== Plots =================================

fprintf('\n ###################### \n');

plot(factor_list, J_train, 'bo-');
hold on;
plot(factor_list, J_CV, 'ro-');

xlabel('Fraction of sample size')
ylabel('J(theta)')

legend('J(train)', 'J(CV)')
hold on;


%==== Plot Difference Between Curves =========

learning_diff = J_CV - J_train
plot(factor_list, learning_diff, 'go-');
hold on;

%============================================

end
