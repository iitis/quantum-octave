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

function ret = Recover(state, code)
# TODO right now code argument is skipped

flag = -1; # 0-bitflip, 1-faseflip, 2-shor

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
	
	lstate = Evolve(ControledGate(3,Not,[1],[2]), lstate);

	outcome = Measure(lstate,"IZI"); # measure first syndrome
	lstate = outcome.state; # evolution
	eigval1 = outcome.eigval([2]); # 1st measurment outcome

	lstate = Evolve(ControledGate(3,Not,[1],[3]), lstate);

	outcome = Measure(lstate,"ZII"); # measure second syndrome
	lstate = outcome.state; # evolution
	eigval2 = outcome.eigval([1]); # 2nd measurment outcome
	
	syn(1) = eigval1*2; # calculate syndroms
	syn(2) = eigval2*2;

	syn=syn' # we want horizontal vector

	if(syn==[-1,-1]) # qubit 1 fliped
		g = ProductGate(3,Not,[1]);
		lstate = Evolve(g,lstate); # so correct him
	elseif (syn==[-1,1])  # qubit 2 fliped
		g = ProductGate(3,Not,[2]);  
		lstate = Evolve(g,lstate); # so correct him
	elseif (syn==[1,-1]) # qubit 3 fliped
		g = ProductGate(3,Not,[3]);  
		lstate = Evolve(g,lstate); # so correct him
	endif

	lstate = Evolve(ControledGate(3,Not,[1],[2]), lstate);
	lstate = Evolve(ControledGate(3,Not,[1],[3]), lstate);

	ret = lstate;

elseif(flag==1) # phaseflip
        if (qs!=3)
                error("state should be density matrix of 3 qubit system")
        endif


elseif(flag==2) # shor
        if (qs!=9)
                error("state should be density matrix of 9 qubit system")
        endif
endif



endfunction
