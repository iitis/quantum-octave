## -*- texinfo -*-
## @deftypefn{Function file} {} Teleport(@var{state})
## The @code{Teleport} function performs teleportation
## protocol for one qubit density matrix @var{sate}. Try
##
## @example
## @group
## Teleport(KetN(1,1))
## @end group
## @end example
##
## @end deftypefn
##
## @seealso{TeleportWithError}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 04 April 2004
## Last modyfication: 26 November 2004

function ret = Teleport(st)

if (nargin != 1)
	usage("Teleport (state)");
else 
	qs = log2(size(st)(2)); # number of qubits in the input state
	
	if(qs!=1)
		error("State should be density matrix of 1 qubit system!");
	endif
	
	# preparation of compound state
	lstate = kron(st, State(Ket([0,0]))); 

	# preparation of bell state
	g1 = Circuit(ProductGate(3, H, [2]), ControlledGate(3, Not, [2], [3]));
	lstate = Evolve(g1, lstate);

	#
	g2 = Circuit(ControlledGate(3,Not,[1],[2]), ProductGate(3,H,[1]));

	lstate = Evolve(g2, lstate);

	o = Measure(lstate,"ZZI");

	lstate = o.state;
	outcome = o.eigval;

	# throw away qubits after measurement
	lstate = PTrace(lstate,[1,2]); 

	# if second qubit is 1 then, negate teleported state
	if (outcome(2)==-0.5)
		lstate = Evolve(Not, lstate);
	endif

	# if first qubit is 1 then, perform Z on teleported state	
	if (outcome(1)==-0.5) 
		lstate = Evolve(Sz, lstate);
	endif

	ret = lstate;
	printf("Teleportation done.\n");
endif
endfunction
