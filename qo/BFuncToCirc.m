## -*- texinfo -*-
## @deftypefn{Function file} {} BFuncToCirc(@var{sizea},@var{sizev},@var{values})
## Function @code{BFunToCirc} 
## @end deftypefn
## @seealso {}
## 

function ret = BFuncToCirc(sizea, sizev, values)
error("Function in alpha stage - does not return apropriate value");

if(nargin!=3)
	usage("BFuncToCirc(sizea, sizev, values)");
endif

if(size(values)(2)!=2^sizea)
	error("Wrong number of values!");
endif

if(max(values)>2^sizev-1)
	error("Not enough qubits for given values!");
endif

valueMatrix=zeros(sizev,2^sizea);
gates = list();

#for each value put its binary representation into matrix
for i=[1:2^sizea]
	valueMatrix(:,i) = Dec2BinVec(values(i),sizev)' ;# we want it to have vertical vectors
endfor

for j=[1:sizev] # for each output qubit
	for i=[1:2^sizea] # for each value
		if(valueMatrix(j,i)==1)
#*			qubit = j
			idx = Dec2BinVec(i-1,sizea)'
			notpos=-1;
# we prepare vector of not gates positions
#*			idx
			l=1;
			for k=[1:sizea] 
				if(idx(k)==0)	
					notpos(l)=k;
					l = l+1;
				endif
			endfor
			notpos
			
			gn=Id(sizea+sizev);
			if(notpos!=-1)
				gn = ProductGate(sizea+sizev,Not,notpos);
			endif
			gcn = CNot(sizea+sizev, [1:sizea],sizea+j);
			gate = Circuit(gn,gcn,gn);
			gates = append(gates,gate);
		endif
	endfor
endfor
ret = gates;

endfunction
