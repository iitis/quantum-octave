## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function PrintAmps (invek)
if (!is_vector(invek))
	error("input vector is not a vector");
endif
if (ceil(log2(size(invek)))!=floor(log2(size(invek))))
	error("input vektor should be of size 1x2^n")

for i = 1:length(invek)
	temp = invek(i);

	if(!iscomplex(temp))
		printf("%+f\t\t",temp);
	else
		printf("%+f + %fi\t",real(temp),imag(temp));
	endif
	printf("|%d>\n",i-1);
endfor
endfunction
