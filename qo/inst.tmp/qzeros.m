function ret=qzeros(matrixsize)
	if(nargin!=1)
		usage("qzeros(matrixsize)");
	endif

	global quantum_octave_sparse;
	if (exist("quantum_octave_sparse") && quantum_octave_sparse==true)
		ret= sparse(matrixsize,matrixsize);
	else
		ret= zeros(matrixsize);
	endif
endfunction