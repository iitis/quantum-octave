function PrintProbs (invek)
tmp = abs(invek).^2;
for i = 1:length(invek)
	printf("%f |%d>\n",tmp(i),i-1);
endfor
endfunction
