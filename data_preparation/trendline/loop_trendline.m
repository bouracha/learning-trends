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
    end
    slopes = [slopes; s];
end

end
