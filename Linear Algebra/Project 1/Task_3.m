clc;
clear all;
close all;
clf;
pkg load symbolic;
axis_low = -2.5;
axis_high = 2.5;
t = linspace(0, 2*pi, 100)';
xc = cos(t);
yc = sin(t);
circle = [xc, yc];
syms x y;
temp_matrix = [x; y]
A = [1, 2; 2, 1]
A*temp_matrix
ellipse = [xc + 2*yc, 2*xc + yc];
%   fig1 = figure();
fig = figure();
subplot(1, 2, 1);
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
title("Figure 3 I");
%   print(fig1,'-dpngalpha', '-r300', 'a.png');
A = [1, 0; 0, 1]
A*temp_matrix
ellipse = [xc, yc];
%   fig2 = figure();
subplot(1, 2, 2);
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
title("Figure 3 II");
%   print(fig2,'-dpngalpha', '-r300', 'i.png');
print(fig,'-dpngalpha', '-r300', '3i_ii.png');