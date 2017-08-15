function [matrix] = matrix_combination(matrix1, matrix2);

matrix1 = strip_matrix(matrix1);
matrix2 = strip_matrix(matrix2);

matrix = [matrix1, matrix2];

end


function [X] = strip_matrix(X);

X(:, [1 2]) = [];

end



