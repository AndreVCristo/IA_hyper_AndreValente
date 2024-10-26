prove(Goal,Hypo,Answer) :-
    max_proof_length(D),
    prove(Goal,Hypo,D,RestD),
    (RestD >= 0, Answer = yes
     ;
     RestD < 0, !, Answer = maybe
    ).

prove(Goal,_,no).

prove(G,H,D,D) :-
    D < 0, !.

prove([],_,D,D) :- !.

prove([G1|Gs], Hypo, D0, D) :- !,
    prove(G1, Hypo, D0, D1),
    prove(Gs, Hypo, D1, D).

prove(G,_,D,D) :- 
    prolog_predicate(G),
    call(G).

prove(G,Hyp,D0,D) :-
    D0 =< 0,!,D is D0-1
    ;
    D1 is D0-1,
    member(Clause/Vars, Hyp),
    copy_term(Clause,[Head|Body]),
    G=Head,
    prove(Body, Hyp, D1, D).