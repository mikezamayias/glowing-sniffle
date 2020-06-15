function task1_function(A)
    A
    characteristic_polynomial = polyout(poly(A), 'x')
    [eve, eva] = eig(A, balanceOption='vector')
    eva1 = eva(1)
    eva2 = eva(2)
    eva3 = eva(3)
endfunction