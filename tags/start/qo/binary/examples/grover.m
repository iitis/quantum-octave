function ret = grover( num, state )
# some data  
	qubits = log2(size(state)(1));
	tvec = [1:qubits];
	k = ceil((pi/8)*sqrt(size(state)(1)));
	bigh = ProductGate(qubits,H,tvec);
# Grover iterations
	ret = Evolve(bigh,state);
	for i = 1:k
		ret = Evolve(oracle(num, qubits),ret);
		ret = Evolve(diffuse(qubits),ret);
	endfor
endfunction

function ret = oracle (num, qubits)
# check if num<2^qubits
	ret =  eye (2^qubits);
	ret(num+1,num+1) = -1;
endfunction

function ret = diffuse(qubits)
	tvec = [1:qubits];
	tmp = zeros(1,qubits);
	ret = ProductGate(qubits,H,tvec);
	ret = ret*(2*Projection(tmp) - Id(qubits));
	ret = ret*ProductGate(qubits,H,tvec);
endfunction
