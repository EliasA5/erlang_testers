-module(ex3_tester).
-author(elias).

-export([test/0]).


test() ->
    sortResTester(),
    sortTester(fun ex3:mSort/1),
    sortTester(fun ex3:qSort/1).
    
sortResTester() ->
    myApply1( [ {fun ex3:sortRes/2, [2,3,9,5,6,7,8,1,4,10], [3,6,9,1,4,7,10,2,5,8]} ] ).

sortTester(F) ->
    myApply( [{F, [ [1,2,3,1,3,4,7,4] ], [1,1,2,3,3,4,4,7]}, 
              {F, [[]], []},
              {F, [ [1,6,5,2,8,3,3,3,3] ], [1,2,3,3,3,3,5,6,8]}] ).

myApply1([]) -> ok;
myApply1([{F, A, R}|T]) ->
    assert(apply(F,[A,lc]), R),
    assert(apply(F,[A,pm]), R),
    assert(apply(F,[A,lm]), R),
    myApply1(T).

myApply([]) -> ok;
myApply([{F, A, R} | T]) ->
    assert(apply(F, A), R),
    myApply(T).

assert(A,A)->ok;
assert(A,B)->
    io:format("expected ~p, got ~p~n", [B, A]),
    error("unexpected output").



