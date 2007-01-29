## -*- texinfo -*-
## @deftypefn {Function file} {} Sy()
## Function @code{Sy} returns 2x2 Pauli sigma y matrix. 
## 
## @end deftypefn
##
## @seealso {Sx, Sz, Id, Not, H}
##

function ret = Sy
	ret = [0,-i;i,0];
endfunction
