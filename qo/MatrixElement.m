## -*- texinfo -*-
## @deftypefn {Function file} {} MatrixElement(state,k,l)
## Function @code{MatrixElement} returns matrix element (k,l) of
## density matrix @var{state}.
##
## @example 
## @group
## MatrixElement(State([0,0,0]))
##  @result{} 
##	
##	
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {State, ProductGate, PartialTrace}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 8 March 2004

function ret = MatrixElement(state,k,l)
# dimension of state we operate on
dim = size(state)(1);
	if (k <= 0 || l <= 0 )
		error("Only positive index are vailid!");
	endif
	if (dim < k || dim < l)
		error("Dimensions doesn't match!")
	endif
	ret = KetN(l,log2(dim))'*(state*KetN(l,log2(dim)));
endfunction
