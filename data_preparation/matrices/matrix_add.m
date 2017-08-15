function [matrix] = matrix_add(matrix1, matrix2);

matrix2 = strip_matrix(matrix2);

matrix = [matrix1, matrix2];

end


function [X] = strip_matrix(X);

X(:, [1 2]) = [];

end



