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

function ret = Decode(state, code)

flag = -1; # 0-bitflip, 1-faseflip, 2-shor

if(nargin!=2)
        usage("Decode(state, \"biflip\"|\"phaseflip\"|\"shor\")");
endif

if(strcmp(code,"bitflip"))
        flag=0;
elseif(strcmp(code,"phaseflip"))
        flag=1;
elseif(strcmp(code,"shor"))
        flag=2;
else
        usage("Decode(state, \"biflip\"|\"phaseflip\"|\"shor\")");
endif

qs = log2(size(state)(2)); # number of qubits in the input state

if (flag==0) # bitflip
	if (qs!=3)
	        error("state should be density matrix of 3 qubit system")
	endif
        g = ControlledGate(3,Not,[1],[2])*ControlledGate(3,Not,[1],[3]); # decoding gate
        ret = Evolve(g, state);
elseif(flag==1) # faseflip
	if (qs!=3)
	        error("state should be density matrix of 3 qubit system")
	endif
        g = ProductGate(3,H,[1,2,3]);
        g*= ControlledGate(3,Not,[1],[2])*ControlledGate(3,Not,[1],[3]); # decoding gate
        ret = Evolve(g, state);
elseif(flag==2) # shor
 	if (qs!=9)
	        error("state should be density matrix of 9 qubit system")
	endif
        gc = ControlledGate(3,Not,[1],[2])*ControlledGate(3,Not,[1],[3]);
        g = Kron(gc,gc,gc);
        g*= ProductGate(9,H,[1,4,7]);
	g*= ControlledGate(9,Not,[1],[4])*ControlledGate(9,Not,[1],[7]);
        ret = Evolve(g, state);
endif

endfunction
