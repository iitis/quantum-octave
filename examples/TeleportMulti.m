## -*- texinfo -*-
## @deftypefn{Function file} {} Teleport(@var{state})
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 04 April 2004

function ret = TeleportMulti(st)

if(nargin!=1)
	usage("Teleport (state)");
endif

qs = log2(size(st)(2)); # number of qubits in the input state

lstate = kron(st, State(Ket(zeros(1,2*qs)))); # preparation of bigger state
qls = log2(size(lstate)(2));

#swaping some qubits to get better ordering
for i=1:qs
	lstate = Evolve(Swap(qls, [i,1+(i-1)*3]), lstate);
endfor

# prepare teleportation gate :-) like in ST
g1 = Circuit(ProductGate(3, H,[2]), ControlledGate(3,Not,[2],[3]));
g2 = Circuit(ControlledGate(3,Not,[1],[2]), ProductGate(3,H,[1]));
telgate = Circuit(g1,g2);

gate = 1;
for i=1:qs
	gate= kron(gate, telgate);
endfor
#perform evolution
lstate = Evolve(gate, lstate);

#perform measurement
mstr="";
for i=1:qs
	mstr = strcat(mstr,"ZZI");
endfor

o = Measure(lstate, mstr);
#perform evolution
lstate = o.state;
outcome = o.eigval

#calculate qubits indexes to traceout
tmp = zeros(qs,2);
for i=1:qs
	tmp(i,:)=[i-1,i-1]*3+[1,2];
endfor
tr = sort(vec(tmp))';

#traceout measured qubits
lstate = PTrace(lstate,tr);

#perform correction
gate = Id(qs);
for i=1:qs
	if (outcome((i-1)*3+2)<0) # if second qubit is 1 then, negate teleported state
		gate = Circuit(gate,ProductGate(qs,Not,i));
	endif
	if (outcome((i-1)*3+1)<0) # if first qubit is 1 then, perform Z on teleported state
		gate = Circuit(gate,ProductGate(qs,Sz,i));
	endif
endfor
lstate = Evolve(gate, lstate);
ret = lstate;

printf("Teleportation done.\n");
endfunction
