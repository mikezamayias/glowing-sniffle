clc;
clear all;
close all;

#   create a random 2x2 matrix:
#       x = floor(rand(2,2)*10);

#   task 1
A = [7, 9, 8; 7, 4, 7; 5, 8, 2; 9, 4, 2];
disp("A = "), disp(A);
#   task 2
B = [8, 5, 4; 2, 5, 9; 9, 4, 9; 3, 4, 9];
disp("B = "), disp(B);
#   task 3
task3 = A + B;
disp("A + B = "), disp(task3);
#   task 4
task4 = A - B;
disp("A - B = "), disp(task4);
#   task 5
C = [1, 8, 2];
disp("C = "), disp(C);
#   task 6
task6 = C + B;
disp("C + B = "), disp(task6);
