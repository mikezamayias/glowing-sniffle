function function_task1(A, b)
    det_A = det(A);
    disp("");
    if (det_A != 0)
        disp("Το σύστημα έχει μοναδική λύση.")
        Axb_roots = A\b;
        x = Axb_roots(1)
        y = Axb_roots(2)
        z = Axb_roots(3)
    else
        n = size(b)(1);
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
        if (det_x == 0 && det_y == 0 && det_z == 0)
            disp("Το σύστημα είναι αόριστο.")
        else
            disp("Το σύστημα είναι αδύνατο.")
        endif
    endif
end