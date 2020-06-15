clc;
clear all;
close all;

#   matrix A
A = [1, 2, 3; 2, 4, 5; 3, 5, 0];

[rws, cols] = size(A);
#   if A square matrix, then do stuff
if (rws == cols)
    task1_function(A)
else
    disp('A is not square matrix.')
endif
