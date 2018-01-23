## -*- texinfo -*-
## @deftypefn {Function file} {} sy()
## Function @code{sy} returns 2x2 Pauli sigma y matrix. 
## 
## @end deftypefn
##
## @seealso {sx, sz, id, not, h}
##

function ret = sy
	ret = [0,-i;i,0];
endfunction
