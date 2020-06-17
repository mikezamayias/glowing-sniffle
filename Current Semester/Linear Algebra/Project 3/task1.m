clc;
clear all;
close all;
warning('off', 'all');

#   matrix A
A = [1, 2, 3; 2, 4, 5; 3, 5, 0];

[rws, cols] = size(A);
#   if A square matrix, then do stuff
if (rws == cols)
    disp('A =');
    disp(A);
    [ueves, evas, char_poly] = task1_function(A)
    #   tolerance, to be used for converting -0 to 0
    tolerance = 1.e-6;
    #   transpose evas
    evas = evas;
    #   calculate vieta theorem with current state evas
    v_trace = round(sum(evas));
    v_det = round(prod(evas));
    #   multiply a 3x3 identity matrix with evas
    evas = eye(3)*evas';
    #   calculate vieta theorem with altered evas
    check_v_trace = round(sum(evas));
    check_v_det = round(prod(evas));
    #   transpose evas to row
    evas = evas';
    #   convert -0 to 0
    evas(evas<0 & evas>-tolerance) = 0;
    #   output message for vieta's formulae
    if (v_trace == check_v_trace & v_det == check_v_det)
        disp("\nVieta's formulae are valid for matrix A.")
    else
        disp("\nVieta's formulae are not valid for matrix A.")
    endif
else
    disp('A is not square matrix.')
endif
