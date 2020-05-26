clc;
clear all;
close all;

#   vectors u, v, w
u = [3, -4, 5];
v = [2, -3, 1];
w = [1, -1, 0];
#   matrix A from vectors
A = [u; v; w];
#   make zero column matrix b the size of A
b = zeros(size(A)(1), 1);
#   run first task's logic
[l1, l2, l3] = function_task1(A, b)