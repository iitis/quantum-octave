## -*- texinfo -*-
## @deftypefn Id([@var{siz}])
## Function @code{Id(@var{size})} returns 2^size x 2^size Id matrix,
## argument is optional, if not suplied is set to 1.
## @end deftypefn

## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Id(varargin)
	if(nargin==1)
		ret = eye(2^di);
	elseif(nargin==0)
		ret = eye(2);
	else
		error("Only one argument can be suplied for this funcion")
	endif
endfunction
