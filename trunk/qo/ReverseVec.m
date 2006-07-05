## -*- texinfo -*-
## @deftypefn {Function file} {} ReverseVec(@var{vec})
## Function @code{ReverseVec} reverses indexes in vector @var{vec}.
##
## @example
## @group
## ReverseVec([1,2,3,5])
##  @result{}
##  [5,3,2,1]
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Dec2BinVec, BinVec2Dec, Ket, BinVec}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003
## Last modification: 05 July 2006

function ret = ReverseVec(vec)

if (nargin =! 1 )
	usage ("ReverseVec (vector)");
endif

ret=0;
	
if ( !isvector(vec) )
		error ("Single vector expected as argument!");
	endif

vs = size(vec)(2);

for i = 1:vs
	ret(i) = vec(vs+1 -i);
endfor

endfunction
