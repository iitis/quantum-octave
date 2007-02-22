## -*- texinfo -*-
## @deftypefn {Function file} {} TrNorm(@var{mtx})
## Function @code{TrNorm} returns trace norm of matrix @var{mtx}, that is
## @code{TrNorm(mtx) = trace(sqrtm(mtx'*mtx))}
## 
## @example 
## @group
## TraceNorm(State(Ket([0,0,0])))
##  @result{}
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {sqrtm, eig}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 26 March 2004

function ret = TrNorm(mtx)
	if ( nargin != 1) 
		usage("TrNorm (mtx)");
	end
	ret =  trace(sqrtm(mtx'*mtx));
end
