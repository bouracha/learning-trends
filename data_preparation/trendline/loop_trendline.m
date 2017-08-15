function [slopes] = loop_trendline(min_indice, max_indice, nums, data);


slopes = [];
for i = min_indice:max_indice
    s = [i, data(i)];
    for n = nums
        [s1, s2] = trendline(i, n, data);
        %=== Only slope1 is defined ===
        %=== if n is 1 ================
        if (n == 1)
            s = [s];
        else
            s = [s, s1, s2];
        end
    %===== Editting ================
    for n = nums
        for i = min_indice:max_indice
            data_quanta = quantum_standardisation(i, n, data);
            
            [s1, s2] = trendline(i, n, data_quanta);
            K = oscillator(i, n, data_quanta);
            firstdiff = diff1(i, n, data_quanta);
            secondDiff = diff2(i, n, data_quanta);
            s = [s, s1, s2, K, firstdiff, secondDiff];
        end
    end     
    %=============================  
    end
    slopes = [slopes; s];
end

end
