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

function ret = H
	ret = 1/sqrt(2)*[1,1;1,-1];
endfunction
