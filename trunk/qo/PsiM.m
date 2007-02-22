## -*- texinfo -*-
## @deftypefn {Function file} {} PsiM
## Function @code{PsiM} returns @code{Ket} vector
## for @code{1/sqrt(2)*(Ket([0,1]) - Ket([1,0]))} Bell state.
## 
## @end deftypefn
##
## @seealso {Ket, PhiP, PhiM, PsiP, GHZ, W, Werner}
##

function ret = PsiM
	ret = 1/sqrt(2)*[0,1,-1,0]';
end
