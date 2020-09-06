clc;
clear all;
close all;
clf;
axis_low = -0.5;
axis_high = 2.5;
A = [1, 2; 2, 1]
x1 = [1; 0]
x2 = [0; 1]
Ax1 = A*x1
Ax2 = A*x2
fig = figure();
%   fig1 = figure();
subplot(1, 2, 1);
hold on
#   plot([0, x1(1)], [0, x1(2)], "linewidth", 2, "color", [0 0.4470 0.7410], ";x1;")
#   plot(0, 0, "color", [0 0.4470 0.7410], ";x1;")
quiver(0, 0, x1(1), x1(2), "linewidth", 2, "color", [0 0.4470 0.7410])
hold on
#   plot([0, Ax1(1)], [0, Ax1(2)], "linewidth", 2, "color", [0.6350 0.0780 0.1840], ";Ax1;")
#   plot(0, 0, "color", [0.6350 0.0780 0.1840], ";A*x1;")
quiver(0, 0, Ax1(1), Ax1(2), "linewidth", 2, "color", [0.6350 0.0780 0.1840])
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
title("Figure 2 I");
%   print(fig1,'-dpngalpha', '-r300', 'x1.png');
%   fig2 = figure();
subplot(1, 2, 2);
hold on
#   plot([0, x2(1)], [0, x2(2)], "linewidth", 2, "color", [0 0.4470 0.7410], ";x2;")
#   plot(0, 0, "color", [0 0.4470 0.7410], ";x2;")
quiver(0, 0, x2(1), x2(2), "linewidth", 2, "color", [0 0.4470 0.7410])
hold on
#   plot([0, Ax2(1)], [0, Ax2(2)], "linewidth", 2, "color", [0.6350 0.0780 0.1840], ";A*x2;");
#   plot(0, 0, "color", [0.6350 0.0780 0.1840], ";A*x2;")
quiver(0, 0, Ax2(1), Ax2(2), "linewidth", 2, "color", [0.6350 0.0780 0.1840])
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
title("Figure 2 II");
%   print(fig2,'-dpngalpha', '-r300', 'x2.png');
print(fig,'-dpngalpha', '-r300', '2i_ii.png');
