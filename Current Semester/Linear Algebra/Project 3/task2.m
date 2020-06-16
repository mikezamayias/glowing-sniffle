clc;
clear all;
close all;

#   matrix A
A = [3, 4, 2; 2, 5, -2; 7, 1, 1]
[rws, cols] = size(A);
#   if A square matrix, then do stuff
if (rws == cols)
    #   if det(A) do not do stuff
    if (det(A) != 0)
        disp('Determinant of A does not equal to 0.')
    else
        disp('Determinant of A equals to 0.')
        [eigenvectors, e    igenvalues] = task2_function(A)
    endif
else
    disp('A is not square matrix.')
endif

#   matrix A^2
A2 = power(A, 2)
[rws, cols] = size(A2);
#   if A square matrix, then do stuff
if (rws == cols)
    #   if det(A2) do not do stuff
    if (det(A2) != 0)
        disp('Determinant of A^2 does not equal to 0.')
    else
        disp('Determinant of A^2 equals to 0.')
        [eigenvectors, eigenvalues] = task2_function(A2)
    endif
else
    disp('A^2 is not square matrix.')
endif

#   matrix A^-1
A_1 = power(A, -1)
[rws, cols] = size(A_1);
#   if A square matrix, then do stuff
if (rws == cols)
    #   if det(A_1) do not do stuff
    if (det(A_1) != 0)
        disp('Determinant of A^-1 does not equal to 0.')
    else
        disp('Determinant of A^-1 equals to 0.')
        [eigenvectors, eigenvalues] = task2_function(A_1)
    endif
else
    disp('A^-1 is not square matrix.')
endif

#   matrix eq
eq = A2 + 2*A + eye(3)
[rws, cols] = size(eq);
#   if A square matrix, then do stuff
if (rws == cols)
    #   if det(eq) do not do stuff
    if (det(eq) != 0)
        disp('Determinant of A^2 + 2A + I does not equal to 0.')
    else
        disp('Determinant of A^2 + 2A + I equals to 0.')
        [eigenvectors, eigenvalues] = task2_function(eq)
    endif
else
    disp('A^2 + 2A + I is not square matrix.')
endif

