% GENDER FACTS

male(abraham).
male(herb).
male(homer).
male(bart).
male(clancy).

female(mona).
female(marge).
female(patty).
female(selma).
female(jackie).
female(lisa).
female(maggie).
female(ling).

% PARENT FACTS

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).


% RULES

% Father
father(X, Y) :-
    male(X),
    parent(X, Y).

% Mother
mother(X, Y) :-
    female(X),
    parent(X, Y).

% Son
son(X, Y) :-
    male(X),
    parent(Y, X).

% Daughter
daughter(X, Y) :-
    female(X),
    parent(Y, X).

% Brother
brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Sister
sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Grandfather
grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

% Aunt
aunt(X, Y) :-
    female(X),
    parent(P, Y),
    parent(G, P),
    parent(G, X),
    X \= P.

% Uncle
uncle(X, Y) :-
    male(X),
    parent(P, Y),
    parent(G, P),
    parent(G, X),
    X \= P.

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

% Ancestor
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).