function out = mapFeature_7(X1, X2, X3, X4, X5, X6, X7, degree)
% MAPFEATURE Feature mapping function to polynomial features
%
%   Returns a new feature array with more features, comprising of 
%   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
%
%   Inputs X1, X2 must be the same size
%

%degree = 1;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        for k = 0:j
            for l = 0:k
                for m = 0:l
                    for n = 0:m 
                        for o = 0:n
                          out(:, end+1) = (X1.^(i-j)).*(X2.^(j-k)).*(X3.^(k-l)).*(X4.^(l-m)).*(X5.^(m-n)).*(X6.^(n-o)).*(X7.^(o));
                      end
                   end
                end
            end
        end
    end
end

end