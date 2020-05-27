clc;
clear all;
close all;
#   vectors u, v, w
u = [1, -2, 3];
v = [2, -1, 2];
w = [1, -2, 1];
#   check if vector set is basis
basis = lin_dep(u, v, w);
if (basis == 1)
    disp("Orthonormal basis:");
    [e1, e2, e3] = orthonorm_base(u, v, w);
else
    disp("No basis");
endif