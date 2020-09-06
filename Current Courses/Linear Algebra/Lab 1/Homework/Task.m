clc;
clear all;
close all;


x = [4, 1; 2, 1];
disp(x);
x_inv = inv(x);
disp(x_inv);
one = x*x_inv;
disp(one);