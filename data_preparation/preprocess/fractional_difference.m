function y = fractional_difference(min, max, data);

y = [];
for j = min:max
    
    value = data(j);
    prev_value = data(j-1);
    
    diff = (value - prev_value)/prev_value;
    y = [y; diff];
    
end

end
