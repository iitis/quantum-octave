function PrintAmps (invek)
for i = 1:length(invek)
	temp = invek(i);

	if(!iscomplex(temp))
		printf("%+f\t\t",temp);
	else
		printf("%+f + %fi\t",real(temp),imag(temp));
	endif
	printf("|%d>\n",i-1);
#	printf("%f |%d>\n",invek(i),i-1);
endfor
endfunction
