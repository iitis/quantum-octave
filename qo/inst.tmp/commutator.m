## -*- texinfo -*-
## @deftypefn {Function file} {} commutator (@var{mtx1}, @var{mtx2})
## For two given matrices this function return their comutator.
## 
## @example 
## @group
## commutator (Id, H)
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

function ret = commutator(A,B)
	if (nargin!=2)
			usage ('commutator (A, B)');
	endif
	
	if(size(A)~=size(B))
			error('commutator: Matrices are of different sizes!');
	endif
		ret=A*B-B*A;
endfunction
