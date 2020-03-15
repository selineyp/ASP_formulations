%Consider the following robotic problem:
%There are three slices of bread and one hot pan.
%Each slice of bread needs to be toasted on both sides.
%Each side can be toasted by placing it on the hot pan for one minute.
%The pan can only fit two slices of bread at once, and only one side of each at a time.
%How many minutes does it take for a robot to toast all the three slices of bread, and how does the robot do it?

slice(1;2;3).
time(0..n).
time_(0..n-1).
sides(front;back).
opposite(front,back;back,front).

loc(not_pan,S,0):- slice(S).

%exogenous action:put flip and putback
{put(S,T)} :- slice(S),time_(T).
{flip(S,T)} :- slice(S),time_(T).
{put_back(S,T)} :- slice(S),time_(T).

%inertia
{loc(L,S,T+1)} :- loc(L,S,T), time_(T).

%direct effects
1{loc(front,S,T+1);loc(back,S,T+1)}1 :- put(S,T).
loc(L,S,T+1) :- flip(S,T), loc(L1,S,T), opposite(L,L1).
loc(not_pan,S,T+1) :- put_back(S,T).

%indirect effects
toasted(L,S,T+1) :- loc(L,S,T), loc(L,S,T+1), sides(L), time_(T).

%assumptions
:-  #count{S: loc(L,S,T), sides(L)} > 2, time_(T).
:-  loc(L1,S,T), toasted(L,S,T), L1 != L.
:-  put(S,T), loc(L,S,T), L != not_pan.
:- flip(S,T), loc(not_pan, S,T).

:- #count{L:loc(L,S,T)} != 1, slice(S), time(T).

%goal
%goal :- T == T1, T1 = #count{L:slice(L)}, T = #count{L: toasted(front,L,T),toasted(back,L,T)} .
%:- not goal.

goal :-  toasted(front,1,T), toasted(back,1,K), toasted(front,2,M), toasted(back,2,P), toasted(front,3,U), toasted(back,3,W).
:- not goal.

#show put/2.
#show flip/2.
#show put_back/2.
