function ret = ProductGate(gate,dotvek,regsize)
idx = 1;
sort(dotvek);
if (dotvek(1) == 1)
	tmp = gate;
	idx++;
else
	tmp = Id(1);
endif

if (max(dotvek)>regsize || min(dotvek)<1)
	error("ProductGate: qubit index greater then register given size or less than 0");
	return;
endif

for i = 2:regsize
if((idx <= length(dotvek)) && (dotvek(idx) == i))
	tmp = kron(tmp,gate);
	idx++;
else
	tmp = kron(tmp,Id(1));
endif	

endfor
ret = tmp;	
endfunction
