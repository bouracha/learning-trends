function [eval] = loop_evaluation(min_indice, max_indice, data);

eval = [];
num_of_positives = 0;
for i = min_indice:max_indice
    if (data(i+1) > data(i))
        evaluation = 1;
        num_of_positives += 1;
    else
        evaluation = 0;
    end
    eval = [eval; i, data(i), evaluation];
end

num_of_positives
num_of_datapoints = 1+max_indice-min_indice
ratio_positive_negative = num_of_positives/num_of_datapoints

end



