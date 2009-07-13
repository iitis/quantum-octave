function ret=newregister(regsize)
	global quantum_octave_state;
	quantum_octave_state=__kron(quantum_octave_state, state(ketn(0,regsize)));
 	global quantum_register_allocated;
	M=0;
	N=length(quantum_register_allocated);
	for i=[1:N]
		M=max(M,max(quantum_register_allocated{i}));
	endfor
	quantum_register_allocated{N+1}=[M+1:M+regsize];
 	ret=N+1;
endfunction