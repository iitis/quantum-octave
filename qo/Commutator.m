## -*- texinfo -*-
## @deftypefn {Function file} {} Commutator (@var{mtx1}, @var{mtx2})
## For two given matrices this function return their comutator.
## 
## @example 
## @group
## Commutator (Id, H)
##  @result{} 
##	0	0
##	0	0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Id, H, Not}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003
## Last modyfication: 17 May 2004

function ret = Commutator(A,B)
if (nargin!=2)
	usage ("Commutator (mtx_1, mtx_2)");
endif
if(size(A)!=size(B))
	error("Matrices are of different sizes!");
endif
	ret=A*B-B*A;
endfunction
