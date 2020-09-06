clc;
clear all;
close all;

#   square matrix A
A = [1, 2, 1; 2, 1, 0; -1, 1, 0];
#   make an identity matrix the size of A
I_M = eye(size(A)(1));
#   apply gaussian elimination to A and I
B = round(A\I_M);
#   convert negative zeros to zeros (-0 to 0)
B(B == 0) = 0;

#   check if A is invertible based on the relation A*A^-1=I,
#   check if A*B is equal to I, where B=A^-1
if (isequal(A*B, I_M) == 1)
    disp("Matrix A is invertible.")
    disp("A =");
    disp(A);
    disp("B = A\\I");
    disp(B);
else
    disp("Matrix A is non-invertible.")
endif