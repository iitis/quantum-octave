function quantum_octave_print_status()
	global quantum_octave_state;
	global quantum_register_allocated;
	global quantum_octave_sparse;
	
	printf("Allocated qubits %d\n", length(quantum_register_allocated));
	printf("Size of the state matrix is %d\n", size(quantum_octave_state,1));
	if (quantum_octave_sparse)
		printf("Quantum octave uses sparse matrices\n");
	else
		printf("Quantum octave uses full matrices\n");
	endif	
endfunction