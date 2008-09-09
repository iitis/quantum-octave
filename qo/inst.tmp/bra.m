## -*- texinfo -*-
## @deftypefn {Function File} {} bra (@var{binary_vector}, @dots{})
## The @code{ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
##
## @example
## @group
## ket([1,0,1])
## @result{}
##	0
##	0
##	0
##	0
##	0
##	1
##	0
##	0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso{state, sx, id, h}
##

function ret = bra (binvec)
	if (nargin ~= 1 )
		usage ('bra (binvec)');
	endif

	ret = ket(binvec)';
endfunction
