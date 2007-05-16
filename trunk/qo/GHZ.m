%% -*- texinfo -*-
%% @deftypefn {Function file} {} GHZ
%% Function @code{GHZ} returns @code{Ket} vector
%% for @code{1/qsrt(2)*(Ket([0,0,0]) + Ket([1,1,1]))} state.
%% 
%% @end deftypefn
%%
%% @seealso {Ket, W, Phip, PhiM, PsiP, PsiM}
%%

function ret = GHZ
	ret = 1/sqrt(2)*[1,0,0,0,0,0,0,1]';
end