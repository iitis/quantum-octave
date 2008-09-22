# function ret = grover( num, statesize, channelname,p)
# # some data  
# 	st=state(ketn(0,statesize));
# 	qubits = log2(size(st)(1));
# 	tvec = [1:qubits];
# 	k = ceil((pi/8)*sqrt(size(st)(1)));
# 	bigh = productgate(h,tvec,qubits);
# # Grover iterations
# 	ret = evolve(bigh,st);
# 	for i = 1:k
# 		ret = evolve(oracle(num, qubits),ret);
# 		ret = evolve(diffuse(qubits),ret);
# 		if (nargin==4)
# 			ret = applychannel(localchannel(channel(channelname,p),[1:qubits],qubits), ret);
# 		endif
# 	endfor
# endfunction
# 
# function ret = oracle (num, qubits)
# # check if num<2^qubits
# 	ret =  id (qubits);
# 	ret(num+1,num+1) = -1;
# endfunction
# 
# function ret = diffuse(qubits)
# 	tvec = [1:qubits];
# 	tmp = zeros(1,qubits);
# 	ret = productgate(h,tvec,qubits);
# 	ret = ret*(2*projection(tmp) - id(qubits));
# 	ret = ret*productgate(h,tvec,qubits);
# endfunction
# 


function ret = grover( num, statesize, channelname,p)
# some data  
	quantum_octave_init();
	r1=newregister(statesize);
	
	k = floor((pi/4)*sqrt(2^length(qureg(r1))));
	productgate(h,qureg(r1));
# Grover iterations
	evolve(productgate(h,qureg(r1)));
	for i = 1:k
		evolve(oracle(num, length(qureg(r1))));
		evolve(diffuse(qureg(r1)));
 		if (nargin==4)
 			applychannel(localchannel(channel(channelname,p),qureg(r1)));
 		endif
	endfor
 	ret=measurecompbasis();
endfunction

function ret = oracle (num, l)
	ret = id(l);
	ret(num+1,num+1) = -1;
endfunction

function ret = diffuse(register)
	l=length(register);
	ret = circuit(...
					productgate(h,register,l),...
					(2*ketn(0,l)*bran(0,l) - id(l)),...
					productgate(h,register,l)...
				);
endfunction