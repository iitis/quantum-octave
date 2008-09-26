## -*- texinfo -*-
## @deftypefn {Function file} {} GHZ
## Function @code{GHZ} returns @code{Ket} vector
## for @code{1/qsrt(2)*(Ket([0,0,0]) + Ket([1,1,1]))} state.
## 
## @end deftypefn
##
## @seealso {Ket, W, Phip, PhiM, PsiP, PsiM}
##

function ret = ghz(n)
	ret = 1/sqrt(2)*(ket(zeros(1,n))+ket(ones(1,n)));
end