## -*- texinfo -*-
## @deftypefn {Function file} {} Sz()
## Function @code{Sz} returns 2x2 Pauli sigma z matrix.
## Vectors @code{Ket([0])} and @code{Ket([1])} are eigenvectors
## of this matrix  with eigenvalues @code{1} and @code{-1}.
## 
## @end deftypefn
##
## @seealso {Sx, Sy, Id, Not, H}
##

function ret = Sz
	ret = [1,0;0,-1];
endfunction
