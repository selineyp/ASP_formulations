% generate

row(1..9).
column(1..9).
number(1..9).
subgrid(0..8).

cell(X,Y,S) :- row(X),column(Y), subgrid(S), S == ((X - 1) / 3) * 3  +  (Y - 1) / 3.


% input
at(1,7,5).at(1,9,6).
at(2,3,5).at(2,5,8).at(2,9,4).
at(3,3,3).at(3,4,2).at(2,7,1).
at(4,3,2).at(4,5,7).
at(5,2,6).at(5,3,4).at(5,4,5).at(5,7,2).
at(6,2,9).at(6,4,1).
at(7,1,8).at(7,2,7).at(7,4,3).at(7,6,5).
at(8,2,4).at(8,5,2).at(8,6,6).at(8,9,5).
at(9,7,4).

1{at(X,Y,N): number(N)}1 :- cell(X,Y,S).
1{subgrid(X,Y,A,((X - 1) / 3) * 3  +  (Y - 1) / 3 )}1 :- at(X,Y,A).

:- at(X1,Y1,Z1), at(X2,Y2,Z2), X1 != X2,  Y1 == Y2, Z1 == Z2.
:- at(X1,Y1,Z1), at(X2,Y2,Z2), X1 == X2,  Y1 != Y2, Z1 == Z2.
:- at(X1,Y1,Z1), at(X2,Y2,Z2), X1 != X2,  Y1 != Y2, Z1 == Z2, cell(X1,Y1,S1), cell(X2,Y2,S2), S1 == S2.

 #show at/3.
