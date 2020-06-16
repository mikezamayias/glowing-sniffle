function [eves, evas, characteristic_polynomial] = task1_function(A)
    #   eigenvectors and eigenvalues at eves and evas respectively
    [eves, evas] = eig(A, balanceOption='vector');
    #   convert eigenvector matrix to a single column
    eves = eves(: );
    #   make each unit eigenvector
    eve1 = eves(1: 3)/norm(eves(1: 3));
    eve2 = eves(4: 6)/norm(eves(4: 6));
    eve3 = eves(7: 9)/norm(eves(7: 9));
    #   make unit eigenvector to return
    eves = [eve1, eve2, eve3];
    #   tolerance, to be used for converting -0 to 0
    tolerance = 1.e-6;
    #   transpose evas
    evas = evas';
    #   calculate vieta theorem with current state evas
    v_trace = round(sum(evas));
    v_det = round(prod(evas));
    #   multiply a 3x3 identity matrix with eigenvalues
    evas = eye(3)*evas';
    #   calculate vieta theorem with altered evas
    check_v_trace = round(sum(evas));
    check_v_det = round(prod(evas));
    #   transpose evas to row
    evas = evas';
    #   convert -0 to 0
    evas(evas<0 & evas>-tolerance) = 0;
    #   round evas
    evas = round(evas);
    #   set coefficients of characteristc polynomial of A to pre_polynomial
    pre_polynomial = poly(A);
    #   convert any -0 to 0
    pre_polynomial(pre_polynomial<0 & pre_polynomial>-tolerance) = 0;
    #   match coeffcients with variable x at characteristic_polynomial
    characteristic_polynomial = polyout(round(pre_polynomial), 'x');
    #   output message for vieta's formulae
    if (v_trace == check_v_trace & v_det == check_v_det)
        disp("Vieta's formulae are valid for matrix A.")
    else
        disp("Vieta's formulae are not valid for matrix A.")
    endif
endfunction