%———————————————————————————————————————————————
% Learning from family relations

%  Background knowledge

% backliteral(+p(V1,…,Vn),[V1,…,Vn])
% says that the literal of the form p(V1,…,Vn), with variables
% V1,…,Vn possibly renamed, are part of the hypothesis language.
  
backliteral(parent(X,Y),[X,Y]).
backliteral(male(X),[X]).
backliteral(female(X),[X]).

prolog_predicate(parent(_,_)).
prolog_predicate(male(_)).
prolog_predicate(female(_)).

%———————————————————————————————————————————————
% Background Knowledge (BK)

parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(pat, eve).

male(tom).
male(bob).
male(jim).
female(pam).
female(liz).
female(ann).
female(pat).
female(eve).


% has_daughter(X) <- parent(X,Y) ^ female(Y).

%———————————————————————————————————————————————
% Positive examples
% ex(+Example): +Example is a positive example
ex(has_daughter(tom)). %
ex(has_daughter(bob)).
ex(has_daughter(pat)).

%———————————————————————————————————————————————
% Negative examples
%nex(+Example): +Example is a 
nex(has_daughter(pam)).
nex(has_daughter(jim)).

start_hyp([[has_daughter(X)]/[X]]).

%not(P):-
%    P, !, fail.
%not(_).
