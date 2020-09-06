clc;
clear all;
close all;

#   matrix A
A = [1, 2, 3; 2, 4, 5; 3, 5, 0]
[evesA, evasA] = task2_function(A)

#   matrix A^2
A2 = power(A, 2)
[evesA2, evasA2] = task2_function(A2)

#   matrix A^-1
invA = round(inv(A))
[evesinvA, evasinvA] = task2_function(invA)

#   matrix eq
eq = round(power(A + eye(3), 2))
[eveseq, evaseq] = task2_function(eq)

#   diagonal matrix D of A
[_, D] = eig(A);
D = round(D)

#   matrix e^A
eA = round(power(e, A))
[eveseA, evaseA] = task2_function(eA)

#   matrix sinA
sinA = round(sin(A))
[evessinA, evassinA] = task2_function(sinA)