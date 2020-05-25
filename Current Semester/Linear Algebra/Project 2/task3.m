clc;
clear all;
close all;

#   matrix A with system coefficients
u = [3, -4, 5]
v = [2, -3, 1]
w = [1, -1, 0]
A = [u; v; w]
A = A'
b = zeros(size(A)(1), 1)
function_task1(A, b)