## -*- texinfo -*-
## @deftypefn{Function file} {} Name([@var{size}] )
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 04 April 2004

function ret = Teleport(st)

if(nargin!=1)
	usage("Teleport(state)");
endif

qs = log2(size(st)(2)); # number of qubits in the input state

if(qs!=1)
	error("state should be density matrix of 1 qubit system")
endif
lstate = kron(st, State(Ket([0,0]))); # preparation of bigger state

#preparation of bell state
g1 = Circuit(ProductGate(3, H,[2]), ControlledGate(3,Not,[2],[3]));
lstate = Evolve(g1, lstate);

#
g2 = Circuit(ControlledGate(3,Not,[1],[2]), ProductGate(3,H,[1]));

lstate = Evolve(g2, lstate);

o = Measure(lstate,"ZZI");

lstate = o.state;
outcome = o.eigval;

lstate = PTrace(lstate,[1,2]); # throw away qubits after measurement

if (outcome(2)==-0.5) # if second qubit is 1 then, negate teleported state
	lstate = Evolve(Not, lstate);
endif
if (outcome(1)==-0.5) # if first qubit is 1 then, perform Z on teleported state
	lstate = Evolve(Sz, lstate);
endif
	ret = lstate;
#teleportation done
endfunction
