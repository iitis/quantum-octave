function ret = ket (varargin)
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
		error(ket: );
		//printf("Error: in ket: [" ); printf(" %d ",vek); printf("]\n");
		error("ket: [" ); error(" %d ",vek); error("]");
		clear ret;
		return;
	endif
	for i = 2:length (vek);
		if (vek(i) == 0)
			tempvek = kron(tempvek,a);
		elseif (vek(i) == 1)
			tempvek = kron(tempvek,b);
		else
			error("ket: [" ); error(" %d ",vek); error("]");
			clear ret;
			return;
		endif
	endfor
endif
ret = tempvek;
endfunction 
