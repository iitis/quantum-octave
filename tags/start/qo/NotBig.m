#Params in: 	dotvek - vector of indexes of qubits on which Not operation should be performed
#		regsize - size of register on which Not operation is performed 
#Params out:	matrix of size regsize^2 x regsize^2

function ret = NotBig(dotvek,regsize)
idx = 1;
sort(dotvek);
if (dotvek(1) == 1)
	tmp = [0,1;1,0];
	idx++;
else
	tmp = Id(1);
endif	


for i = 2:log2(regsize)
if((idx <= length(dotvek)) && (dotvek(idx) == i))
	tmp = kron(tmp,[0,1;1,0]);
	idx++;
else
	tmp = kron(tmp,Id(1));
endif	

endfor
ret = tmp;	
endfunction
