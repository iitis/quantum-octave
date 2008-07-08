## -*- texinfo -*-
## @deftypefn {Function file} {} sz()
## Function @code{sz} returns 2x2 Pauli sigma z matrix.
## 
## @end deftypefn
##
## @seealso {sx, sy, id, not, h}
##

function ret = sz
	ret = [1,0;0,-1];
endfunction