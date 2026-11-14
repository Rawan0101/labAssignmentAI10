% Rawan Alqattan - FS2
:- dynamic letter/1.

letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

do(1) :- show_letters, menu.
do(2) :- write('Enter the letter:'), nl, read(L), assert(letter(L)), menu.
do(3) :- write('Enter the letter:'), nl, read(L), asserta(letter(L)), menu.
do(4) :- write('Enter the letter:'), nl, read(L), assertz(letter(L)), menu.
do(5) :- write('Enter the letter to delete:'), nl, read(L), delete_letter(L), menu.
do(6) :- retractall(letter(_)), write('All letters were deleted.'), nl, menu.
do(7) :- write('Goodbye!'), nl.
do(_) :- write('Wrong choice, try again.'), nl, menu.

show_letters :-
    findall(L, letter(L), List),
    List == [],
    !,
    write('The set is empty.'), nl.
show_letters :-
    findall(L, letter(L), List),
    write('Current set of letters: '), write(List), nl.

delete_letter(L) :-
    retract(letter(L)),
    !,
    write('Letter deleted.'), nl.
delete_letter(_) :-
    write('This letter is not in the set.'), nl.
