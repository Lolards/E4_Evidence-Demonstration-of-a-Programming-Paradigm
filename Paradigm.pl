% Codeforces 978B - File Name

% count_remove(List, ConsecutiveXCount, Removals)
% Base case: empty list or nothing to remove
count_remove([], _, 0).
 
% If current char is 'x' and we already have 2 consecutive x's,
% this one must be removed. Keep count at 2.
count_remove([x|T], 2, R) :-
    count_remove(T, 2, R1),
    R is R1 + 1.
 
% If current char is 'x' and count is less than 2, increment count
count_remove([x|T], Count, R) :-
    Count < 2,
    NewCount is Count + 1,
    count_remove(T, NewCount, R).
 
% If current char is not 'x', reset consecutive count to 0
count_remove([H|T], _, R) :-
    H \= x,
    count_remove(T, 0, R).
 
% solve(String, Removals)
% Converts atom to list of chars and calls count_remove
solve(String, Removals) :-
    atom_chars(String, Chars),
    count_remove(Chars, 0, Removals).
