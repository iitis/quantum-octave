function ret=newregister(regsize)
	global quantum_octave_state;
	quantum_octave_state=kron(quantum_octave_state, state(ketn(0,regsize)));
 	global quantum_register_allocated;
	M=0;
	for i=[1:length(quantum_register_allocated)]
	
	endfor
	quantum_register_allocated={quantum_register_allocated };

	ret=new;
endfunction