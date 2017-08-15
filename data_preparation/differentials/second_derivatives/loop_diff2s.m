function [diff2s] = loop_diff2s(min_indice, max_indice, nums, data);


diff2s = [];
for i = min_indice:max_indice
    s = [i, data(i)];
    %=== Exclude n=1 1 as this will return 1/1 ===
    for n = nums(2:length(nums))
      secondDiff = diff2(i, n, data);
      s = [s, secondDiff];
    end
    diff2s = [diff2s; s];
end


end
