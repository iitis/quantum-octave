## -*- texinfo -*-
## @deftypefn {Function File} {} bran (@var{int}, @var{size})
## The @code{ketn} function generates vertical complex vector from
## nonnegative number @var{int} in @var{size}-qubit space. If @var{size} is
## @var{size} is ommited the smallest space proper for requested vector.
##
## @example
## @group
## ketn(3,2)
## @result{}
##	0
##	0
##	0
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso{ket, state, id, h}
##

function ret = bran (number, size)
	if ( nargin==1 )
		ret=ketn(number)';
	elseif ( nargin==2 )
		ret = ketn(number,size)';
	elseif (nargin > 2 || nargin <=0 )
		usage ('bran (number, [size])');
	endif
endfunction
