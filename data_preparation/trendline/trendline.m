function [slope1, slope2] = trendline(i, n, data);

data_quanta = quantum_standardisation(i, n, data);

indices = [1:size(data_quanta(:,1))]';

%==== Select Subsection to train for slope1 ====

y = data_quanta;
X = indices;

%y = data(i-n:i);
%X = indices(i-n:i);

%==== Train ======

theta1 = linearRegression(y, X);

slope1 = theta1(2);

%==== Select Subsection to tain for slope1 ====

data_quanta2 = quantum_standardisation(i-1, n, data);

y = data_quanta2;
X = indices;

%y = data(i-n:i-1);
%X = indices(i-n:i-1);

%==== Train ======

theta2 = linearRegression(y, X);

slope2 = theta2(2);

%=====================
end



function [theta] = linearRegression(y, X);

%=== Add Bias unit ======

X = [ones(size(X(:,1))), X];

%========== Initialise Theta ==============

initial_theta = zeros(size(X, 2), 1);

theta = pinv(X'*X)*X'*y;


end
