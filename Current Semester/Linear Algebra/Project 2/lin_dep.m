function lin_dep(u, v, w)
    #   make matrix A from vectors, where vectors are A's columns
    A = [u; v; w]';
    #   calculate A's determinant
    det_A = det(A);
    #   if det_A != 0 then the set of vectors is linearly independent
    #   else the set is linearly dependent
    if (det_A != 0)
        disp("The set of vectors is linearly independent.");
        return 1;
    else
        disp("The set of vectors is linearly dependent.");
        return 0;
    endif
end