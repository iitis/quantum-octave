## -*- texinfo -*-
## @deftypefn {Function File} {} Ket (@var{binary_vector}, @dots{})
## The @code{Ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
## @end deftypefn

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
		#printf("Error: in ket: [" ); printf(" %d ",vek); printf("]\n");
		error("%d is other than 0 or 1", vek(1));
		clear ret;
		return;
	endif
	for i = 2:length (vek);
		if (vek(i) == 0)
			tempvek = kron(tempvek,a);
		elseif (vek(i) == 1)
			tempvek = kron(tempvek,b);
		else
		error("%d is other than 0 or 1", vek(i));
			clear ret;
			return;
		endif
	endfor
endif
ret = tempvek;
endfunction
