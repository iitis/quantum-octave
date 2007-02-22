## -*- texinfo -*-
## @deftypefn {Function file} {} W
## Function @code{W} returns @code{Ket} vector
## for @code{1/sqrt(2)*(Ket([1,0,0]) + Ket([0,1,0]) + Ket([0,0,1]))} state.
## 
## @end deftypefn
##
## @seealso {Ket, GHZ, Phip, PhiM, PsiP, PsiM}
##

function ret = W
	ret = 1/sqrt(3)*[0,1,0,1,0,1,0,0]';
end	
