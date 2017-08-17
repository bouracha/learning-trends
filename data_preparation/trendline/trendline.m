function [slope1, slope2] = trendline(data);

indices = [1:size(data(:,1))]';

%==== Select Subsection to train for slope1 ====

y = data;
X = indices;

%==== Train ======

theta1 = linearRegression(y, X);

slope1 = theta1(2);

%==== Select Subsection to tain for slope1 ====

last_indice = length(data);

y = data(1:(last_indice-1));
X = indices(1:(last_indice-1));

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
