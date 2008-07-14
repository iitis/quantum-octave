## -*- texinfo -*-
## @deftypefn {Function file} {} reversevec(@var{vec})
## Function @code{reversevec} reverses indexes in vector @var{vec}.
##
## @example
## @group
## reversevec([1,2,3,5])
##  @result{}
##  [5,3,2,1]
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {dec2binvec, binvec2dec, ket, binvec}
##

function ret = reversevec(vec)
	if (nargin != 1 )
		usage ('reversevec (vector)');
	endif
	
	ret=0;
		
	if ( !isvector(vec) )
			error ('reversevec: Single vector expected as argument!');
	endif
	
	vs = size(vec)(2);
	
	for i = 1:vs
		ret(i) = vec(vs+1 -i);
	endfor

endfunction
