## -*- texinfo -*-
## @deftypefn {Function file} {} Sx()
## Function @code{Sx} returns 2x2 Pauli sigma x matrix. 
## This is equvalent to quantum Not operation on single qubit.
## 
## @end deftypefn
##
## @seealso {Sy, Sz, Id, Not, H}
##

function ret = Sx
	ret = [0,1;1,0];
endfunction
