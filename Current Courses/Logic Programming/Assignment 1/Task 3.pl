% consult source file:
% https://www.swi-prolog.org/pldoc/man?predicate=consult/1 and
% https://stackoverflow.com/a/16374004/13504709
consult('Task 3 source.pl').

% figure 2
father(kostas, anna).
father(kostas, aris).
husband(kostas, soula).
sex_male(kostas).
sex_male(aris).
sex_female(soula).
sex_female(anna).


% figure 3

% 1.
wife(Y, X) :-
    husband(X, Y).

% 2.
% child(Y, X) :-
    % father(X, Y).

% 3.
mother(Z, Y) :-
    father(X, Y),
    wife(Z, X).

% 4. - merged rule number 2 with rule number 4
child(Y, X) :-
    (   father(X, Y)
    ;   mother(X, Y)
    ).

% 5.
% brother(Y, Z) :-
    % father(X, Y),
    % father(X, Z),
    % sex_male(Y),
    % not(Y=Z).

% 6. - merged rules number 5 and 6
brother(Y, Z) :-
    (   father(X, Y)
    ;   mother(X, Y)
    ),
    (   father(X, Y)
    ;   mother(X, Z)
    ),
    sex_male(Y),
    not(Y=Z).

% 7. - rule 7 implemented in rule 8, skipped

% 8. - created based on the template from rules number 5 and 6
sister(Y, Z) :-
    (   father(X, Y)
    ;   mother(X, Y)
    ),
    (   father(X, Y)
    ;   mother(X, Z)
    ),
    sex_female(Y),
    not(Y=Z).