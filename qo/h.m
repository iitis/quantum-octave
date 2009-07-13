## -*- texinfo -*-
## @deftypefn {Function file} {} h()
## Function @code{h} returns 2x2 Hadamard matrix, that is
## 
## @example 
## @group
## h()
##  @result{} 
##	0.70711   0.70711
##	0.70711  -0.70711
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {id, not}

function ret = h
	ret = 1/sqrt(2) * [1,1;1,-1];
endfunction