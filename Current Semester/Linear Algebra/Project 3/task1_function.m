function [eves, evas, char_poly] = task1_function(A)
    #   eigenvectors and eigenvalues at eves and evas respectively
    [eves, evas] = eig(A, balanceOption='vector');
    #   convert eigenvalues matrix to a row vector
    evas = evas';
    #   convert eigenvectors matrix to a column vector
    eves = eves(: );
    #   make each unit eigenvector
    eve1 = eves(1: 3)/norm(eves(1: 3));
    eve2 = eves(4: 6)/norm(eves(4: 6));
    eve3 = eves(7: 9)/norm(eves(7: 9));
    #   make unit eigenvector to return
    eves = [eve1, eve2, eve3];
    #   set coefficients of characteristc polynomial of A to pre_polynomial
    pre_polynomial = poly(A);
    #   tolerance, to be used for converting -0 to 0
    tolerance = 1.e-6;
    #   convert any -0 to 0
    pre_polynomial(pre_polynomial<0 & pre_polynomial>-tolerance) = 0;
    #   match coeffcients with variable x at char_poly
    char_poly = polyout(round(pre_polynomial), 'x');
endfunction