# see Oemer PhD p.78
function ret=dft(gatesize)
	n=gatesize;
	cir=id(n);
# 	cir=circuit(cir,qubitpermutation([n:-1:1]));
	for i=[1:n]
		for j=[1:i-1]
# 			cir=circuit(cir,cphase(pi/(2^(i-j)),n-j+1,n-i+1,gatesize));
			cir=circuit(cir,cphase(pi/(2^(i-j)),j,i,gatesize));
		endfor
# 		cir=circuit(cir,productgate(h,n-i+1,gatesize));
 		cir=circuit(cir,productgate(h,i,gatesize));
	endfor	
	ret=cir=circuit(cir, flip(n));
# 	ret=circuit(cir,qubitpermutation([n:-1:1]));
endfunction