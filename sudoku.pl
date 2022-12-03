:- use_module(library(clpfd)). 

sudoku(Rows) :-
        length(Linhas, 9), maplist(same_length(Linhas), Linhas),
        append(Linhas, Vs), Vs ins 1..9,         /* ins tem que fazer/
        maplist(all_distinct, Linhas),           /* Maplist incluído como padrão*/
        transposta(Linhas, Colunas),             /* Feito*/
        maplist(all_distinct, Colunas),
        Linhas = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        Blocos(As, Bs, Cs),
        Blocos(Ds, Es, Fs),
        Blocos(Gs, Hs, Is).

Blocos([], [], []).
Blocos([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        Blocos(Ns1, Ns2, Ns3).


/* Função para transpor as linhas*/
transposta([[]|_], []).
transposta(Matrix, [Row|Rows]) :- transposta_1st_col(Matrix, Row, RestMatrix),
                                transposta(RestMatrix, Rows).
transposta_1st_col([], [], []).
transposta_1st_col([[H|T]|Rows], [H|Hs], [T|Ts]) :- transposta_1st_col(Rows, Hs, Ts).


/* função para substituir ins*/
valor_limite(1).
valor_limite(2).
valor_limite(3).
valor_limite(4).
valor_limite(5).
valor_limite(6).
valor_limite(7).
valor_limite(8).
valor_limite(9).

/* Query

problem(1, Rows), sudoku(Rows), maplist(portray_clause, Rows).

*/
