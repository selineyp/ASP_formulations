time(0..n).
time_(0..n-1).

purchase(f;g;b).
opposite(left,right;right,left).

loc(f,left,0).loc(g,left,0).loc(b,left,0).loc(m,left,0).

{cross(A,T)}:- purchase(A),time_(T).
{cross(m,T)}:- time_(T).


%direct effects
loc(m,L1,T+1) :- cross(_,T),loc(m,L,T), opposite(L,L1).
loc(A,L1,T+1) :- cross(A,T),loc(A,L,T), purchase(A), opposite(L,L1).

%
:-  loc(b,L,T),loc(g,L,T),not loc(m,L,T).
:-  loc(g,L,T),loc(f,L,T),not loc(m,L,T).

:- cross(A,T),not cross(m,T).
:- cross(A,T), loc(A,L,T), loc(m,L1,T), opposite(L,L1).
:- #count{A:cross(A,T),purchase(A)} > 1, cross(m,T).

%inertia
{loc(A,L,T+1)} :- loc(A,L,T), time_(T).

:- #count{L: loc(A,L,T)} != 1, time(T), purchase(A).
:- #count{L: loc(m,L,T)} != 1, time(T).


%goal
goal :- loc(m,right,T),loc(g,right,T),loc(f,right,T),loc(b,right,T), time(T).
:- not goal.

#show cross/2.
