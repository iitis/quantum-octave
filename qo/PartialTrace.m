## -*- texinfo -*-
## @deftypefn {Function file} {} PartialTrace(state, dim1, dim2, dim3)
## Function @code{PartialTrace} returns density matrix obtained
## from matrix @var{state} by tracing out subspace of dimension @var{dim2}
## Arguments @var{dim1} and @var{dim3} represents dimensions of subspaces
## of orginal Hilber space H such that H is tensor product of this
## subspaces.
##
## @example 
## @group
## PartialTrace(State([0,0,0]),1,2,2)
##  @result{} 
##	
##	
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ProductGate, PartialTranspose}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 5 March 2004

function ret = PartialTrace(state,dim1,dim2,dim3)
	if (size(state)(1) != dim1*dim2*dim3 )
		error("Dimensions doesn't match!")
	else
		for i = 0:2^dim2 ;
			dec2bin(i)
		endfor
	endif

endfunction
