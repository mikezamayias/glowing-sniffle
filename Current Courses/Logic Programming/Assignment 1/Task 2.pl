% a)

edge(a, b).
% a is connected to b
edge(a, d).
% a is connected to d
edge(b, c).
% b is connected to c
edge(b, e).
% b is connected to e
edge(c, d).
% c is connected to d
edge(d, e).
% d is connected to e


% b)

connected(A, B):-
    edge(A, _); edge(_, B).
    % using the anonymous variable _ here
    % instead if using a singleon variable