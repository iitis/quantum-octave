function ret = Swap(s, qubits)
if (nargin!=2)
	usage("Swap(state, qubits)");
endif
if (size(qubits)(2)!=2)
	error("only exactly 2 qubits can be swaped!");
endif

if( (qubits(1)>s) || (qubits(2)>s) )
	error("Qubit index out of bound!");
endif

if (qubits(1)==qubits(2))
	ret =Id(s);
else
	g1 = CNot(s, qubits(1), qubits(2));
	g2 = CNot(s, qubits(2), qubits(1));
	g3 = CNot(s, qubits(1), qubits(2));

	ret = Circuit(g1,g2,g3);
endif

endfunction
