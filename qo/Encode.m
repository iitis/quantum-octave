## -*- texinfo -*-
## @deftypefn{Function file} {} Name([@var{size}] )
## Function @code{Id(@var{size})} returns 2^size x 2^size dentity
## matrix, argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## Name(2)
##  @result{}
##	1  0  0  0 
##	0  1  0  0
##	0  0  1  0
##	0  0  0  1
## @end group
## @end example
## @end deftypefn
## @seealso {Id, Not, H, Pase}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 23 March 2004

function ret = Encode(state, code)
# TODO right now code argument is skipped

flag = -1; # 0-bitflip, 1-faseflip, 2-shor

if(nargin!=2)
	usage("Encode(state, \"biflip\"|\"phaseflip\"|\"shor\")");
endif

if(strcmp(code,"bitflip"))
	flag=0;
elseif(strcmp(code,"phaseflip"))
	flag=1;
elseif(strcmp(code,"shor"))
	flag=2;
else
	usage("Encode(state, \"biflip\"|\"phaseflip\"|\"shor\")");
endif

qs = log2(size(state)(2)); # number of qubits in the input state

if(qs!=1)
	error("state should be density matrix of 1 qubit system")
endif

if (flag==0) # bitflip
	g = ControledGate(3,Not,[1],[2])*ControledGate(3,Not,[1],[3]); # encoding gate
	newstate = kron(state, State(Ket([0,0])));
	ret = Evolve(g, newstate);
elseif(flag==1) # faseflip
	g = ControledGate(3,Not,[1],[2])*ControledGate(3,Not,[1],[3]); # encoding gate
	g*= ProductGate(3,H,[1,2,3]);
	newstate = kron(state, State(Ket([0,0])));
	ret = Evolve(g, newstate);
elseif(flag==2) # shor
	g = ControledGate(9,Not,[1],[4])*ControledGate(9,Not,[1],[7]); 
	g*= ProductGate(9,H,[1,4,7]);
	gc= ControledGate(3,Not,[1],[2])*ControledGate(3,Not,[1],[3]); 
 	g*= Kron(gc,gc,gc);
	newstate = kron(state, State(KetN(0,8)));
	ret = Evolve(g, newstate);
endif

endfunction
