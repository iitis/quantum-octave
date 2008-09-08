# reg1=newregister(4);
# reg2=newregister(2);
# 
# # state=evolve(productgate(sx,reg1(1:2)),state);
# evolve(productgate(sx,reg1(1:2)));
# evolve(qif(qrgr(reg1,2),{h,reg2(2)},{sx,reg2(1)}));
# clearregister(reg2);
# registersetto(reg1,3);
# registersetto(reg1,[0,1,2,3]);
# a=collapse(reg1);
# 
# for i=[1:10]
# 	evolve(qif(qreq(reg1,i),{h,reg2(i)},{id,reg2(1)}));
# endfor

function ret=dft(gatesize)
	n=gatesize;
	cir=id(n);
	for i=[1:n]
		for j=[i:i-1]
			cir=circuit(cir,cphase(pi/(2^(i-j)),n-j,n-i,gatesize));
		endfor
		cir=circuit(cir,productgate(h,n-i,gatesize));
	endfor	
	ret=(cir, qubitpermutation([n:1]));
endfunction