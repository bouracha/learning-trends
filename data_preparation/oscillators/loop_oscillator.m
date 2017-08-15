function [Ks] = loop_oscillator(min_indice, max_indice, nums, data);

Ks = [];
for i = min_indice:max_indice
    s = [i, data(i)];
    for n = nums
      K = oscillator(i, n, data);
      s = [s, K];
    end
    Ks = [Ks; s];
end

end
