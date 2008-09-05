function ret=qureg(reg)
	global quantum_register_allocated;
	ret=quantum_register_allocated{reg};
endfunction