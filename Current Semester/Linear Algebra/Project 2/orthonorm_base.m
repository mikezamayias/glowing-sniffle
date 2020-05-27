#   make orthonormal base from given vectors
function [e1, e2, e3] = orthonorm_base(u, v, w)
    #   make orthogonal vectors a, b,c from u, v, w respectively
    a = u;
    b = v - (dot(a, v) / dot(a, a) * a);
    c = w - (dot(a ,w) / dot(a, a) * a) - (dot(b, w) / dot(b, b) * b);
    #   make orthonormal vectors e1, e2, e3 from a, b, c respectively
    e1 = rats(a/sqrt(dot(a, a)))
    e2 = rats(b/sqrt(dot(b, b)))
    e3 = rats(c/sqrt(dot(c, c)))
endfunction