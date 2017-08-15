function [differential] = diff1(i, n, data);

data = quantum_standardisation(i, n, data);

last_element = (length(data(:,1)));

%==== Rate of change for given parameters ======

differential = (data(last_element) - data(1))/n;

%differential = (data(i) - data(i-n))/n;

%===============================================

end
