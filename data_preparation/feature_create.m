function [matrix_features] = feature_create(min_indice, max_indice, nums, data);


matrix_features = [];
for i = min_indice:max_indice
    features = [i, data(i)];
    for n = nums      
        data_quanta = quantum_standardisation(i, n, data);

        [s1, s2] = trendline(data_quanta);
        K = oscillator(data_quanta);
        %moving_average = mean(data_quanta);
        firstdiff = diff1(i, n, data_quanta);
        secondDiff = diff2(i, n, data_quanta);
        features = [features, s1, s2, K, firstdiff, secondDiff];
    end
    matrix_features = [matrix_features; features];
end     
 
end
