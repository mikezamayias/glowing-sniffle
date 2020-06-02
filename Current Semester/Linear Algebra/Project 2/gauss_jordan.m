#   algorithm to apply gauss-jordan on matrix
#   this code isn't used in the project
function b = gauss_jordan(a)
    # Find dimensions of input matrix
    [m_rows, m_columns] = size(a);

    # If input matrix is not square, stop function
    if (m_rows != m_columns)
        disp('Only Square Matrices, please')
        b = [];
        return
    endif

    # Target identity matrix to be transformed into the output
    # inverse matrix
    b = eye(m_rows);

    # The following code actually performs the matrix inversion by working
    # on each element of the input
    for j = 1 : m_rows
        for i = j : m_rows
            if (a(i, j) != 0)
                for k = 1 : m_rows
                    s = a(j, k);
                    a(j, k) = a(i, k);
                    a(i, k) = s;
                    s = b(j, k);
                    b(j, k) = b(i, k);
                    b(i, k) = s;
                end
                t = 1 / a(j, j);
                for k = 1 : m_rows
                    a(j, k) = t * a(j, k);
                    b(j, k) = t * b(j, k);
                end
                for L = 1 : m_rows
                    if (L != j)
                        t = -a(L, j);
                        for k = 1 : m_rows
                            a(L, k) = a(L, k) + t * a(j, k);
                            b(L, k) = b(L, k) + t * b(j, k);
                        end
                    endif
                end           
            endif
            break
        end
        # Display warning if a row full of zeros is found
        if a(i, j) == 0
            disp('Warning: Singular Matrix')
            b = 'error';
            return
        endif
    end
endfunction