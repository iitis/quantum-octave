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

function ret = H
	ret = 1/sqrt(2)*[1,1;1,-1];
endfunction
