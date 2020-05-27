#   check if linear system has solutions
function [x, y, z] = lin_sys(A, b)
    #   calulcate A's determinant
    det_A = det(A);
    #   check if the system has a unique non-trivial solution
    #   check if A's determinant is non-zero
    if (det_A != 0)
        disp("The system has a unique non-trivial solution:")
        #   calculate system's unique non-trivial solution
        #   using Gaussian elimination
        Axb_roots = A\b;
        #   convert negative zeros to zeros (-0 to 0)
        Axb_roots(Axb_roots == 0) = 0;
        #   diplay solution
        x = Axb_roots(1);
        y = Axb_roots(2);
        z = Axb_roots(3);
    else
        #   get the size of b matrix
        n = size(b)(1);
        #   calculate Cramer's determinants for the system
        x_up = A;
        y_up = A;
        z_up = A;
        for i = 1 : n
            x_up(i, 1) = b(i);
        end
        det_x = det(x_up)/det_A;
        for i = 1 : n
            y_up(i, 2) = b(i);
        end
        det_y = det(y_up)/det_A;
        for i = 1 : n
            z_up(i, 3) = b(i);
        end
        det_z = det(z_up)/det_A;
        #   check if all of Cramer's determinants are equal to zero,
        #   then the system has infinite solutions
        if (det_x == 0 && det_y == 0 && det_z == 0)
            disp("The system has infinite solutions.")
        #   if not all of Cramer's determinants are equal to zero,
        #   then the system has no non-trivial solutions
        else
            disp("The system has no non-trivial solutions.")
        endif
    endif
end