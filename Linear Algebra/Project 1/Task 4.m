clc;
clear all;
close all;
clf;
axis_low = -4;
axis_high = 4;
t = linspace(0, 2*pi, 100)';
xc = cos(t);
yc = sin(t);
circle = [xc, yc];
ellipse = [xc + 2*yc, 2*xc + yc];
eigvec1 = abs(-1)*[1; -1];
eigvec2 = abs(3)*[1; 1];
fig1 = figure();
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
quiver(0, 0, eigvec1(1), eigvec1(2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
hold on
quiver(0, 0, eigvec2(1), eigvec2(2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
print(fig1,'-dpngalpha', '-r300', '4i.png');
exit
ellipse = [xc, yc];

fig2 = figure();
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
print(fig2,'-dpngalpha', '-r300', '4ii.png');