function [eves, evas] = task2_function(A)
    #   eigenvectors and eigenvalues at eves and evas respectively
    [eves, evas] = eig(A, balanceOption='vector');
    #   convert eigenvector matrix to a single column
    eves = eves(: );
    #   make each unit eigenvector
    eve1 = eves(1: 3);
    eve2 = eves(4: 6);
    eve3 = eves(7: 9);
    #   make unit eigenvector to return
    eves = [eve1, eve2, eve3];
    #   tolerance, to be used for converting -0 to 0
    tolerance = 1.e-6;
    #   transpose evas
    evas = evas';
    #   convert -0 to 0
    evas(evas<0 & evas>-tolerance) = 0;
    #   round evas
    evas = round(evas);
endfunction