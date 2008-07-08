## -*- texinfo -*-
## @deftypefn {Function file} {} sx()
## Function @code{sx} returns 2x2 Pauli sigma x matrix. 
## This is equvalent to quantum Not operation on single qubit.
## 
## @end deftypefn
##
## @seealso {sz, sy, id, not, h}
##

function ret = sx
	ret = [0,1;1,0];
endfunction