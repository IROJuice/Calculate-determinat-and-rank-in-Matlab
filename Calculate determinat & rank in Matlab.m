function determinant = cofactor_determinant()
% This function prompts the user to enter a square matrix and calculates its determinant using the cofactor method

% Get matrix dimensions from user
n = input('Enter the dimension of the matrix: ');

% Prompt user to enter elements of the matrix
disp('Enter the elements of the matrix:');
A = zeros(n,n);
for i = 1:n
    for j = 1:n
        A(i,j) = input(sprintf('A(%d,%d) = ',i,j));
    end
end

% Define the base case
if n == 1
    determinant = A(1);
    rankA = 1;
    return;
end

% Define the recursive case
determinant = 0;
for j = 1:n
    % Calculate the cofactor of A(1,j)
    if j == 1
        sign = 1;
    elseif mod(j,2) == 0
        sign = 1;
    else
        sign = -1;
    end
    submatrix = A(2:end, [1:j-1 j+1:end]);
    cofactor = sign * cofactor_determinant(submatrix);
    
    % Add the contribution of this cofactor to the determinant
    determinant = determinant + A(1,j) * cofactor;
end

% Calculate the rank of the matrix
rankA = rank(A);

% Display the results
disp('The determinant of the matrix is:');
disp(determinant);
disp('The rank of the matrix is:');
disp(rankA);

end
