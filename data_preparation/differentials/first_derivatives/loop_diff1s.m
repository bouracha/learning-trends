function [diff1s] = loop_diff1s(min_indice, max_indice, nums, data);


diff1s = [];
for i = min_indice:max_indice
    s = [i, data(i)];
    for n = nums
      firstdiff = diff1(i, n, data);
      s = [s, firstdiff];
    end
    diff1s = [diff1s; s];
end


end
