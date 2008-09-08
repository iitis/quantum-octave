function ret=dft(gatesize)
	n=gatesize;
	cir=id(n);
	for i=[1:n]
		for j=[1:j-1]
			cir=circuit(cir,cphase(pi/(2^(i-j)),n-j+1,n-i+1,gatesize));
		endfor
		cir=circuit(cir,productgate(h,n-i+1,gatesize));
	endfor	
	ret=cir;#circuit(cir, flip(n));
endfunction