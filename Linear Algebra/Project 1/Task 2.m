clc;
clear all;
close all;
clf;

axis_low = -5;
axis_high = 5;


A = [1, 2; 2, 1];
x1 = [1; 0];
x2 = [0; 1];
Ax1 = A*x1;
Ax2 = A*x2;


hold on
plot([0, x1(1)], [0, x1(2)], "linewidth", 2, "color", [0 0.4470 0.7410], ";x1;")
hold on
plot([0, Ax1(1)], [0, Ax1(2)], "linewidth", 2, "color", [0.8500 0.3250 0.0980], ";A*x1;");

grid on;
box off;
axis ([axis_low, axis_high, axis_low, axis_high], "square");
pause