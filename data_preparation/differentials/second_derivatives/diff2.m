function [differential] = diff2(i, n, data);

data = quantum_standardisation(i, n, data);

last_element = (length(data(:,1)));

f1 = diff1(last_element, 1, data);
fn = diff1(last_element, n, data);

%f1 = diff1(i, 1, data);
%fn = diff1(i, n, data);

differential = (f1 - fn)/n;

end
