function ret=flip(gatesize)
	n=gatesize;
	cir=id(n);
	for i=[1:n/2]
		cir=circuit(cir,swapgate([i,n-i+1],gatesize));
	endfor
	ret=cir;
endfunction