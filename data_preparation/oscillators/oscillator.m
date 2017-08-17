function [K] = oscillator(data);

%==== Select Subsection to train for slope1 ====

y = data;

L_n = min(y);
H_n = max(y);

%=== If the highest and lowest are the same then ===
%=== there's no buy or selling signal. This would ==
%=== obviously be rare and most likely with n=1 ====
if ((H_n - L_n) == 0)
    K = 0.5;
else
    last_element = length(data);
    K = (data(last_element) - L_n)/(H_n - L_n);
end


end
