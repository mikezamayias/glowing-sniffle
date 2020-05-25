clc;
clear all;
close all;

#   matrix A with system coefficients
A = [3, 4, 2; 1, -2, 0; 0, 3, 1];
#   matrix b with system constants
b = [3; 3; 2];
#   print A and b
disp("A =");
disp(A);
disp("b =");
disp(b);
#   run first task's logic
function_task1(A, b)

#   add new line to seperate outputs
disp("\n")

#   matrix A with system coefficients
A = [0, 1, 1; 1, 2, 0; -1, 3, 1];
#   matrix b with system constants
b = [3; 0; 2];
#   print A and b
disp("A =");
disp(A);
disp("b =");
disp(b);
#   run first task's logic
function_task1(A, b)