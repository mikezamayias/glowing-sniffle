clc;
clear all;
close all;
#   load symbolic package
pkg load symbolic;
#   set symbolic settings
syms initpython;
sympref display unicode;
#   default A matrix
A = [1, 2; 2, 1]
#   symbolic var x
syms x;
#   x*I
xI = x*eye(2,2)
#   A - x*I
AsubxI = A-xI
#   det(A - x*I)
detAsubxI = det(AsubxI)
#   solve det(A - x*I) = 0
eigenvalues = double(solve(detAsubxI==0))
#   two roots
x1 = -1;
x2 = 3;
#   use first root
disp("Using eigenvalue x1 = -1:")
#   make B matrix by replacing x with -1 in A - x*I
B = subs(AsubxI,x1);
#   apply gaussian elimmination on B
[_, B] = lu(B);
B
#   symbolic var k1, k2
syms k1 k2;
#   solve equation to find k1, k2
k1 = solve(2*k1+2*k2-0)
#   let k1 = 1, then k2 = -1
Eigenvector1 = [1;-1]
#   use second root
disp("Using eigenvalue x2 = 3:")
#   make B matrix by replacing x with 3 in A - x*I
B = subs(AsubxI,x2);
[_, B] = lu(B);
B
#   symbolic var k1, k2
syms k1 k2;
#   solve equation to find k1, k2
k1 = solve(-2*k1+2*k2-0)
#   let k1 = 1, then k2 =1
Eigenvector2 = [1;1]
#   A matrix created by the last digit from my registration number, 0
A = [1, 0; 0, 1]
#   symbolic var x
syms x;
#   x*I
xI = eye(2,2)*x
#   A - x*I
AsubxI = A-xI
#   det(A - x*I)
detAsubxI = det(AsubxI)
#   solve det(A - x*I) = 0
eigenvalues = double(solve(detAsubxI == 0))
#   one root
x1 = 1;
#   use root
disp("Using eigenvalue x = 1:")
#   make B matrix by replacing x with 1 in A - x*I
B = subs(AsubxI, x1);
[_, B] = lu(B);
B
#   symbolic var k1, k2
syms k1 k2;
#   solve equation to find k1, k2
k1 = solve(0*k1+0*k2-0)
#   let k1 = 1, then k2 = -1
Eigenvector1 = [1;-1]
