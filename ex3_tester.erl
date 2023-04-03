-module(ex3_tester).
-author(elias).

-export([test/0]).


test() ->
    sortResTester(),
    sortTester(fun ex3:mSort/1),
    sortTester(fun ex3:qSort/1),
    matElemMulTester(),
    filterTester(fun ex3:filter_g/2),
    filterTester(fun ex3:filter_p/2),
    evenTester(),
    fibTester(fun ex3:fiboR/1),
    fibTester(fun ex3:fiboT/1)
    .

%% start auxilary functions

assertApply1([]) -> ok;
assertApply1([{F, A, R}|T]) ->
    assert(apply(F,[A,lc]), R),
    assert(apply(F,[A,pm]), R),
    assert(apply(F,[A,lm]), R),
    assertApply1(T).

assertApply([]) -> ok;
assertApply([{F, A, R} | T]) ->
    assert(apply(F, A), R),
    assertApply(T).

assert(A,A)->ok;
assert(A,B)->
    io:format("expected ~p, got ~p~n", [B, A]),
    error("unexpected output").

%% end of auxilary functions

sortResTester() ->
    assertApply1( [ {fun ex3:sortRes/2, [2,3,9,5,6,7,8,1,4,10], [3,6,9,1,4,7,10,2,5,8]} ] ).

sortTester(F) ->
    assertApply( [{F, [ [1,2,3,1,3,4,7,4] ], [1,1,2,3,3,4,4,7]}, 
              {F, [[]], []},
              {F, [ [1,6,5,2,8,3,3,3,3] ], [1,2,3,3,3,3,5,6,8]},
              {F, [ [2,1] ], [1,2]} ] ).

matElemMulTester() ->
    F = fun ex3:matElemMult/2,
    Mat1 = [[1,2,3],[4,5,6],[5,6,7]],
    Mat2 = [[8,9,10],[11,12,13],[14,15,16]],
    ResMat = [[8.0,18.0,30.0],[44.0,60.0,78.0],[70.0,90.0,112.0]],
    assertApply([{F, [Mat1, Mat2], ResMat}]).

filterTester(F) ->
    assertApply([{F, [[1,a,2,b,c,3,4,5], numbers], [a,b,c]},
                 {F, [[1,a,2,b,c,3,4,5], atoms], [1,2,3,4,5]},
                 {F, [[1,elem,elem,c,b,a,2,3,4,5], atoms], [1,2,3,4,5]},
                 {F, [[1,elem,elem,c,b,a,2,3,4,5], numbers], [elem,elem,c,b,a]},
                 {F, [[1.0,elem,1.5,1.789,5], numbers], [elem]},
                 {F, [[1.0,elem,1.5,1.789,5], atoms], [1.0,1.5,1.789,5]}]).

evenTester() ->
    F = fun ex3:even/1,
    assertApply([{F, [[]], []},
                 {F, [[1,2,3,4,5,6,7,8,9]], [2,4,6,8]},
                 {F, [[1]], []}]).

fibTester(F) ->
    assertApply([{F, [4], 3},
                 {F, [1], 1},
                 {F, [2], 2},
                 {F, [10], 55}]).

