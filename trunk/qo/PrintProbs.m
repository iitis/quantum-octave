## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function PrintProbs (invek)
tmp = abs(invek).^2;
for i = 1:length(invek)
	printf("%f |%d>\n",tmp(i),i-1);
endfor
endfunction
