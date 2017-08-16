function [differential] = diff1(i, n, data);

last_element = length(data);

%==== Rate of change for given parameters ======

differential = (data(last_element) - data(1))/n;

%===============================================

end
