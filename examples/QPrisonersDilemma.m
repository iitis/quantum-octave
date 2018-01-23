function QPrisonersDilemma
	printf("Stan poczatkowy\n");
	init = State(KetN(0,2))

	printf("Starategia gracza A\n");
	strA = strategy(pi/3, 0)

	printf("Starategia gracza B\n");
	strB = strategy(0, 0)

	MJ = mJ(pi/3);

	s1 = Evolve(MJ, init);
	s2 = Evolve(Kron(strA,strB), s1);

	printf("Stan koncowy\n");
	s3 = Evolve(MJ',s2)
	
endfunction

function ret = strategy(t,f)
	ret = zeros(2,2);
	ret(1,1) = exp(f*i)*cos(t/2);
	ret(1,2) = sin(t/2);
	ret(2,1) = -1*sin(t/2);
	ret(2,2) = -1*exp(f*i)*cos(t/2);
endfunction

function ret = mJ(l)
	D = [0,1;-1,0];
  X = 0.5*l*i*Kron(D,D);
  ret = expm(X);
endfunction

