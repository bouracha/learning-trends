function [differential] = diff2(i, n, data);

last_element = length(data);

f1 = diff1(last_element, 1, data);
fn = diff1(last_element, n, data);


differential = (f1 - fn)/n;

end
