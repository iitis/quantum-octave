## -*- texinfo -*-
## @deftypefn H()
## Function @code{H} returns 2x2 Hadamard matrix
## @end deftypefn

## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret  = H
	ret = 1/sqrt(2)*[1,1;1,-1];
endfunction
