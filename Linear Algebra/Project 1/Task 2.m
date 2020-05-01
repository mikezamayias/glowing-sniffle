clc;
clear all;
close all;
clf;

axis_low = -0.5;
axis_high = 2.5;

A = [1, 2; 2, 1];
x1 = [1; 0];
x2 = [0; 1];
Ax1 = A*x1;
Ax2 = A*x2;

fig = figure();
#   fig1 = figure();
subplot(1, 2, 1);
hold on
#   plot([0, x1(1)], [0, x1(2)], "linewidth", 2, "color", [0 0.4470 0.7410], ";x1;")
#   plot(0, 0, "color", [0 0.4470 0.7410], ";x1;")
quiver(0, 0, x1(1), x1(2), "linewidth", 2, "color", [0 0.4470 0.7410])
hold on
#   plot([0, Ax1(1)], [0, Ax1(2)], "linewidth", 2, "color", [0.8500 0.3250 0.0980], ";Ax1;")
#   plot(0, 0, "color", [0.8500 0.3250 0.0980], ";A*x1;")
quiver(0, 0, Ax1(1), Ax1(2), "linewidth", 2, "color", [0.8500 0.3250 0.0980])
grid on;
box on;
axis ([axis_low, axis_high, axis_low, axis_high], "square");
#   print(fig1,'-dpngalpha', '-r100', 'x1.png');

#   fig2 = figure();
subplot(1, 2, 2);
hold on
#   plot([0, x2(1)], [0, x2(2)], "linewidth", 2, "color", [0.3010 0.7450 0.9330], ";x2;")
#   plot(0, 0, "color", [0.3010 0.7450 0.9330], ";x2;")
quiver(0, 0, x2(1), x2(2), "linewidth", 2, "color", [0.3010 0.7450 0.9330])
hold on
#   plot([0, Ax2(1)], [0, Ax2(2)], "linewidth", 2, "color", [0.9290 0.6940 0.1250], ";A*x2;");
#   plot(0, 0, "color", [0.9290 0.6940 0.1250], ";A*x2;")
quiver(0, 0, Ax2(1), Ax2(2), "linewidth", 2, "color", [0.9290 0.6940 0.1250])
grid on;
box on;
axis ([axis_low, axis_high, axis_low, axis_high], "square");
#   print(fig2,'-dpngalpha', '-r100', 'x2.png');

print(fig,'-dpngalpha', '-r300', 'x.png');
