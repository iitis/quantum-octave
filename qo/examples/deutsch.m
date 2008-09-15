function ret = deutsch(num)
	# declare registers	
	r1=newregister(1);
	r2=newregister(1);
	# declare functions
	f{1}=id(2);
	f{2}=productgate(sx,qureg(r2));
	f{3}=qif(qreq(qureg(r1),1),...
			{sx,qureg(r2)},...
			{id,qureg(r2)});
	f{4}=qif(qreq(qureg(r1),0),...
			{sx,qureg(r2)},...
			{id,qureg(r2)});
	# do the algorithm
	evolve(productgate(sx,qureg(r2)));
	evolve(productgate(h,[qureg(r1),qureg(r2)]));	
	evolve(f{num});	
	evolve(productgate(h,qureg(r1)));	
	# throw away second register
  clearregister(qureg(r2));
	# return the outcome
	ret=measurecompbasis();
endfunction
# 
# function ret = deutsch( num, state )
# #TODO check if input is valid state
# 
# f1 = Id(2);
# f2 = kron(Id(1), Not);
# f3 = CNot(2, [1], [2]);
# f4 = kron(Not, Id(1))* CNot(2, [1], [2])* kron(Not, Id(1));
# if (num == 1)
# 	f=f1;
# elseif (num == 2)
# 	f=f2;
# elseif (num == 3)
# 	f=f3;
# elseif (num == 4)
# 	f=f4;
# else
# 	#blad
# endif
# 
#  
# algorithm = kron(H,H) * kron(Id(1),Not) * f * kron(H, Id(1));
# 
# ret = Evolve(algorithm,state);
# endfunction
