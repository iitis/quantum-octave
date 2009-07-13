function clearregister(reg)
	global quantum_octave_state;
	global quantum_register_allocated;
	quantum_octave_state=ptrace(quantum_octave_state, quantum_register_allocated{reg});
	M=0;
	N=length(quantum_register_allocated);
	M=min(quantum_register_allocated{reg});
	quantum_register_allocated{reg}=[];
	for i=[reg:N]
		quantum_register_allocated{i}=quantum_register_allocated{i}-M+1;
	endfor
endfunction