
{shoot(T)} :- T= 0..n-1.
{load(T)}:- T= 0..n-1.

alive(0).
loaded(0).

loaded(T+1):- load(T), -loaded(T),T = 0..n-1.
-alive(T+1):- shoot(T), alive(T), T = 0..n-1.

:- shoot(T), -loaded(T) , T = 0..n.
:- load(T), loaded(T), T = 0..n.

{loaded(T+1)}:- loaded(T), T = 0..n.
{alive(T+1)}:- alive(T), T = 0..n.


:-shoot(T), load(T), T=0..n-1.


:- not loaded(n).
:- not -alive(n).

goal :- loaded(T),-alive(T).
:- not goal.

#show load/1.
#show shoot/1.
