clc;
clear all;
close all;

#   matrix A
A = [1, 2, 3; 2, 4, 5; 3, 5, 0];

[rws, cols] = size(A);
#   if A square matrix, then do stuff
if (rws == cols)
    disp('A =')
    disp(A);
    if (det(A) != 0)
        disp('Determinant of A does not equal to 0.')
    else
        disp('Determinant of A equals to 0.')
        [unit_eigenvectors, eigenvalues, characteristic_polynomial] = task1_function(A)
    endif
else
    disp('A is not square matrix.')
endif

disp("\n");

#   matrix A
A = [1, 2, 3; 4, 5, 6; 7, 8, 9];

[rws, cols] = size(A);
#   if A square matrix, then do stuff
if (rws == cols)
    disp('A =')
    disp(A);
    if (det(A) != 0)
        disp('Determinant of A does not equal to 0.')
    else
        disp('Determinant of A equals to 0.')
        [unit_eigenvectors, eigenvalues, characteristic_polynomial] = task1_function(A)
    endif
else
    disp('A is not square matrix.')
endif
