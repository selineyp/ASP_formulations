

row(1..n).
col(1..n).

n { q(I,J) : row(I), col(J) } n.


:- q(X1, Y1), q(X2, Y2), X1 == X2, Y1 != Y2.
:- q(X1, Y1), q(X2, Y2), Y1 == Y2, X1 != X2.
:- q(X1, Y1), q(X2, Y2), (X1,Y1) != (X2,Y2), X1 - Y2 == X2 - Y2.
:- q(X1, Y1), q(X2, Y2), (X1,Y1) != (X2,Y2), X1 + Y1 ==  X2 + Y2.

#show q/2.
