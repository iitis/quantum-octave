## -*- texinfo -*-
## @deftypefn {Function File} {} Ket (@var{binary_vector}, @dots{})
## The @code{Ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
## @end deftypefn

## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Ket (varargin)
a = [1,0]';
b = [0,1]';
ret = [0];
tempvek = 0;

vek = va_arg();
nargin--;
while (nargin--)
	vek = [vek, va_arg ()];
endwhile

if ( isvector (vek))
	if (vek(1) == 0)
		tempvek = a;
	elseif (vek(1) == 1)
		tempvek = b;
	else
		error("%d is other than 0 or 1", vek(1));
	endif
	for i = 2:length (vek);
		if (vek(i) == 0)
			tempvek = kron(tempvek,a);
		elseif (vek(i) == 1)
			tempvek = kron(tempvek,b);
		else
			error("%d is other than 0 or 1", vek(i));
		endif
	endfor
endif
ret = tempvek;
endfunction
