function ret = grover( num, statesize, channelname,p)
# some data  
	st=state(ketn(0,statesize));
	qubits = log2(size(st)(1));
	tvec = [1:qubits];
	k = ceil((pi/8)*sqrt(size(st)(1)));
	bigh = productgate(h,tvec,qubits);
# Grover iterations
	ret = evolve(bigh,st);
	for i = 1:k
		ret = evolve(oracle(num, qubits),ret);
		ret = evolve(diffuse(qubits),ret);
		if (nargin==4)
			ret = applychannel(localchannel(channel(channelname,p),[1:qubits],qubits), ret);
		endif
	endfor
endfunction

function ret = oracle (num, qubits)
# check if num<2^qubits
	ret =  id (qubits);
	ret(num+1,num+1) = -1;
endfunction

function ret = diffuse(qubits)
	tvec = [1:qubits];
	tmp = zeros(1,qubits);
	ret = productgate(h,tvec,qubits);
	ret = ret*(2*projection(tmp) - id(qubits));
	ret = ret*productgate(h,tvec,qubits);
endfunction
