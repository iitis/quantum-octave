## -*- texinfo -*-
## @deftypefn {Function file} {} psim
## Function @code{psim} returns @code{Ket} vector
## for @code{1/sqrt(2)*(Ket([0,1]) - Ket([1,0]))} Bell state.
## 
## @end deftypefn
##
## @seealso {Ket, PhiP, PhiM, PsiP, GHZ, W, Werner}
##

function ret = psim()
	ret = 1/sqrt(2)*[0,1,-1,0]';
endfunction
