## -*- texinfo -*-
## @deftypefn {Function file} {} H()
## Function @code{H} returns 2x2 Hadamard matrix, that is
## 
## @example 
## @group
## H()
##  @result{} 
##	0.70711   0.70711
##	0.70711  -0.70711
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Id, Not}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Commutator(A,B)
if (nargin!=2)
	error("Function takes two parameters!")
endif
if(size(A)!=size(B))
	error("Matrices are of different sizes!");
endif
	ret=A*B-B*A;
endfunction
