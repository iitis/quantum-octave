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

function ret = Recover(state, code)

flag = -1; # 0-bitflip, 1-phaseflip, 2-shor

if(nargin!=2)
        usage("Recover(state, \"bitflip\"|\"phaseflip\"|\"shor\")");
endif

if(strcmp(code,"bitflip"))
        flag=0;
elseif(strcmp(code,"phaseflip"))
        flag=1;
elseif(strcmp(code,"shor"))
        flag=2;
else
        usage("Recover(state, \"bitflip\"|\"phaseflip\"|\"shor\")");
endif

qs = log2(size(state)(2)); # number of qubits in the input state

if (flag==0) # bitflip
        if (qs!=3)
                error("state should be density matrix of 3 qubit system")
        endif
	lstate=state;
	
	lstate = Evolve(ControlledGate(3,Not,[2,3],[1]), lstate);
	
	outcome = Measure(lstate,"IZZ"); # measure second syndrome
	lstate = outcome.state; # evolution

	ret = PTrace(lstate, [2:3]);

elseif(flag==1) # phaseflip
        if (qs!=3)
                error("state should be density matrix of 3 qubit system")
        endif
	lstate=state;
	
	lstate = Evolve(ControlledGate(3,Not,[2,3],[1]), lstate);
	
	outcome = Measure(lstate,"IZZ"); # measure second syndrome
	lstate = outcome.state; # evolution
	
	newstate = PTrace(lstate, [2:3]);
	
	ret = newstate;
elseif(flag==2) # shor
	if (qs!=9)
		error("state should be density matrix of 9 qubit system")
	endif
	lstate = state;
	
	outcome = Measure(lstate, "IZZIZZIZZ");
	lstate = outcome.state;
	
	lstate = PTrace(lstate, [2,3,5,6,8,9]);

	g = Circuit(ProductGate(3,H,[1:3]), ControlledGate(3,Not,[1],[2]), ControlledGate(3,Not,[1],[3]), ControlledGate(3,Not,[2,3],[1]));
		
	lstate = Evolve(g,lstate);
	
	outcome = Measure(lstate,"IZZ");
	lstate = outcome.state;
	
	lstate = PTrace(lstate, [2,3]);
	
	ret = lstate;
		
endif

endfunction
