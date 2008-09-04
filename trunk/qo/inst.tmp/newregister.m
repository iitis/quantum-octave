function ret=newregister(regsize)
	global quantum_octave_state;
	quantum_octave_state=kron(quantum_octave_state, state(ketn(0,regsize)));
 	global quantum_register_allocated;
	M=max([quantum_register_allocated 0]);
	new=[M+1, M+regsize]
	quantum_register_allocated=sort([quantum_register_allocated new]);

	ret=new;
endfunction