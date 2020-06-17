function [eves, evas] = task2_function(A)
    #   eigenvectors and eigenvalues at eves and evas respectively
    [eves, evas] = eig(A);
    #   round eves and evas
    eves = round(eves);
    evas = round(evas);
    #   tolerance, to be used for converting -0 to 0
    tolerance = 1.e-6;
    #   convert -0 to 0
    evas(tolerance<evas & evas<0) = 0;
    eves(tolerance<eves & eves<0) = 0;
endfunction