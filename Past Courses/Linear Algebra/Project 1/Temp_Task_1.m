clc;
clear all;
close all;

%   input 2x2 symmetric matrix
A = [1, 2; 2, 1];
disp('A = '), disp(A);
%   calculate characteristic polynomial of previous matrix
c = poly(A);
disp('The characteristic polynomial of A is:');
polyout(c, 'λ');
%   calculate eigenvalues by solving the characteristic polynomial
disp('Eigevalues of A, by solving the characteristic polynomial of A:');
x = round(roots(c));
disp(x);
%   calculate unit eigenvectors by solving one of the equations that produce the eigenvector
