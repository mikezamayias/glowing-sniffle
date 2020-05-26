function function_task3(u, v, w)
    #   make matrix A from vectors;
    A = [u; v; w];
    #   calculate A's determinant
    det_A = det(A);
    #   if det_A != 0 then the set of vectors is linearly independent
    #   else the set is linearly dependent
    if (det_A != 0)
        disp("The set of vectors is linearly independent.");
    else
        disp("The set of vectors is linearly dependent.");
    endif
end