function ret = MixStates(varargin)
summtr = 0;
coef = 1;
sum = 0;
while(nargin--)
temp = va_arg();
	if(length(temp)>1)
		if (coef==1) 
			sum++;
		endif
		summtr+=coef.*temp;
		coef=1;
	else
		coef=temp;
		sum+=coef;
	endif
endwhile
sum;
ret = summtr./sum;

endfunction
