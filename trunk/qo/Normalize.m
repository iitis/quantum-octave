function ret = Normalize(varargin)
ret = [0];
vek = va_arg();
tempmtr = zeros(length(vek),nargin);
#varargin;
va_start();
ketlngth = length(vek);
while (nargin--)
        vek = va_arg ();
        if ( isvector (vek) && length(vek)==ketlngth)
        	tempmtr(:,nargin+1)=vek;
	else
		error("Normalize: vectors are of different sizes");
		clear ret;
		return;
	endif
endwhile
        ret = sum(tempmtr,2);
        norm = sqrt(ret'*ret);
        ret = ret./norm;
endfunction
