function clearregister(reg)
	error("don't touch me!");
	global quantum_octave_state;
	quantum_octave_state=PTrace(quantum_octave_state, reg);
	global quantum_register_allocated;
	quantum_register_allocated=setdiff(quantum_register_allocated, reg);
endfunction