% Rawan Alqattan - FS2
user(rawan, pass123).
user(sara, abc456).
user(noura, secret99).

login :- attempt(1).

attempt(N) :-
    write('Enter username:'), nl,
    read(U),
    write('Enter password:'), nl,
    read(P),
    check(U, P, N).

check(U, P, _) :-
    user(U, P),
    !,
    write('Login Successful'), nl.
check(_, _, N) :-
    N < 3,
    !,
    write('Login Unsuccessful'), nl,
    N1 is N + 1,
    attempt(N1).
check(_, _, _) :-
    write('Login Unsuccessful'), nl,
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.
