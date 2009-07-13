## -*- texinfo -*-
## @deftypefn {Function file} {} tracenorm(@var{mtx})
## Function @code{tracenorm} returns trace norm of matrix @var{mtx}, that is
## @code{tracenorm(mtx) = trace(sqrtm(mtx'*mtx))}
## 
## @example 
## @group
## tracenorm(State(Ket([0,0,0])))
##  @result{}
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {sqrtm, eig}
##

function ret = tracenorm(mtx)
	if ( nargin ~= 1) 
		help tracenorm;
		return;
	endif
	ret =  trace(sqrtm(mtx'*mtx));
endfunction
