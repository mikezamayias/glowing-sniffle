% a)

% a is connected to b
edge(a, b).
% a is connected to d
edge(a, d).
% b is connected to c
edge(b, c).
% b is connected to e
edge(b, e).
% c is connected to d
edge(c, d).
% d is connected to e
edge(d, e).


% b)

connected(A, B):-
    edge(A, _); edge(_, B).
    % using anonymous variable _ here,
    % instead of using a singleon variable
    % https://www.swi-prolog.org/pldoc/man?section=singleton