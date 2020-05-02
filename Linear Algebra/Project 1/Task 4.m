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
eigvec_i1 = abs(-1)*[1; -1]
eigvec_i2 = abs(3)*[1; 1]
eigvec_ii1 = 1*[1; 0]
eigvec_ii2 = 1*[0; 1]
exit
%   fig1 = figure();
fig = figure();
subplot(1, 2, 1);
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
quiver(0, 0, eigvec_i1(1), eigvec_i1(2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
hold on
quiver(0, 0, eigvec_i2(1), eigvec_i2(2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
title("Figure 4 I");
%   print(fig1,'-dpngalpha', '-r300', '4i.png');
ellipse = [xc, yc];
%   fig2 = figure();
subplot(1, 2, 2);
hold on
plot(circle(:,1), circle(:,2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
quiver(0, 0, eigvec_ii1(1), eigvec_ii1(2), "linewidth", 2, "color", [0 0.4470 0.7410]);
hold on
plot(ellipse(:,1), ellipse(:,2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
hold on
quiver(0, 0, eigvec_ii2(1), eigvec_ii2(2), "linewidth", 2, "color", [0.6350 0.0780 0.1840]);
grid on;
box on;
axis([axis_low, axis_high, axis_low, axis_high], "square");
title("Figure 4 II");
%   print(fig2,'-dpngalpha', '-r300', '4ii.png');
print(fig,'-dpngalpha', '-r300', '4i_ii.png');
