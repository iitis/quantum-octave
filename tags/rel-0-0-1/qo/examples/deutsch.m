function ret = deutsch( num, state )
#TODO check if input is valid state

f1 = Id(2);
f2 = kron(Id(1), Not);
f3 = CNot(2, [1], [2]);
f4 = kron(Not, Id(1))* CNot(2, [1], [2])* kron(Not, Id(1));
if (num == 1)
	f=f1;
elseif (num == 2)
	f=f2;
elseif (num == 3)
	f=f3;
elseif (num == 4)
	f=f4;
else
	#blad
endif

 
algorithm = kron(H,H) * kron(Id(1),Not) * f * kron(H, Id(1));

ret = Evolve(algorithm,state);
endfunction
