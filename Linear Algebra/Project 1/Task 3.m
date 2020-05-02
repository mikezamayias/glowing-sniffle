pkg load symbolic;

clc;
clear all;
close all;
clf;

axis_low = -2.5;
axis_high = 2.5;

t = linspace(0, 2*pi, 100)';
xc = cos(t);
yc = sin(t);
circle = [xc, yc];
syms x y;
B = [x; y]

A = [1, 2; 2, 1]
A*B
ellipse = [xc + 2*yc, 2*xc + yc];

fig1 = figure();
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.9290 0.6940 0.1250]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
print(fig1,'-dpngalpha', '-r300', 'a.png');

A = [1, 0; 0, 1]
A*B
ellipse = [xc, yc];

fig2 = figure();
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.9290 0.6940 0.1250]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
print(fig2,'-dpngalpha', '-r300', 'i.png');