/*import de módulos
*/
:- use_module(library(random)).
:- use_module(library(lists)).


/* Loop referentes a lista de listas.*/
loop1(0).
loop1(N, A) :- N>0, 
    Lista1 = [],
    S is N-1, 
    loop1(S),
    loop2(9, Lista1),
    append(Lista1, A, A).

/* Loops referente a lista de elementos, tentando fazer uma definição de valores que seja de 33% de chance
Não respeita as restrições.*/
loop2(N, Lista1) :- N>0, 
    Lista2 = [],
    S is N-1,
    loop2(S, Lista2),
        random(1, 100, X), 
        (
            (X =< 33, random_between(1, 9, Y),
            append(Y, Lista2, Lista2));
            (X >33, append(_, Lista2, Lista2))
        ),
    append(Lista2, Lista1, Lista1).




/* Regra que chama a geração de sudoku com 33% de chance.*/
generate_sudoku() :- A = [],
    loop1(9,A),
    write(A).
