function ret =  MagicSquares(a,b,error_gate,error_idx)

	if (a>3 || a<1 || b>3 || b<1)
		error ("Only integer arguments between 1 and 3");
	endif

	A1 = 1/sqrt(2) * [ I 0 0 1 ; 0 -I 1 0 ; 0 I 1 0 ; 1 0 0 I];
	A2 = 1/2 * [ I 1 1 I ; -I 1 -1 I; I 1 -1 -I ; -I 1 1 -I];
	A3 = 1/2 * [ -1 -1 -1 1 ; 1 1 -1 1 ; 1 -1 1 1 ; 1 -1 -1 -1];

	B1 = 1/2 * [ I -I 1 1; -I -I 1 -1 ; 1 1 -I I ; -I I 1 1];
	B2 = 1/2 * [ -1 I 1 I ; 1 I 1 -I ; 1 -I 1 I ; -1 -i 1 -I];
	B3 = 1/sqrt(2) * [ 1 0 0 1 ; -1 0 0 1 ; 0 1 1 0 ; 0 1 -1 0];

	gameMtx = zeros(4);
	inState = 1/2*Ket([0 0 1 1]) - 1/2*Ket([0 1 1 0]) - 1/2*Ket([1 0 0 1]) + 1/2*Ket([1 1 0 0]);

	switch a
		case { 1 } gameMtx = A1;
		case { 2 } gameMtx = A2;
		case { 3 } gameMtx = A3;
	endswitch 

	switch b
		case { 1 } gameMtx = Kron(gameMtx,B1);
		case { 2 } gameMtx = Kron(gameMtx,B2);
		case { 3 } gameMtx = Kron(gameMtx,B3);
	endswitch 

	s = Evolve(gameMtx,State(inState));
	s1= Evolve(ProductGate(4,error_gate,error_idx),s);

	s2=Measure(s1,"ZZZZ");
	a1=PTrace(s2.state,[3,4]);
	b1=PTrace(s2.state,[1,2]);
	

	alices_bits=0;
	bobs_bits=0;
	
	
	a1=abs(a1);
	if a1==State(Ket([0,0]))
		alices_bits=[0,0,0];
	elseif a1==State(Ket([0,1]))
		alices_bits=[0,1,1];
	elseif a1==State(Ket([1,0]))
		alices_bits=[1,0,1];
	elseif a1==State(Ket([1,1]))
		alices_bits=[1,1,0];
	else
		a1			
		error("Matrix a1 is not a projective operator")	
	endif	

	b1=abs(b1);
	if b1==State(Ket([0,0]))
		bobs_bits=[0,0,1];
	elseif b1==State(Ket([0,1]))
		bobs_bits=[0,1,0];
	elseif b1==State(Ket([1,0]))
		bobs_bits=[1,0,0];
	elseif b1==State(Ket([1,1]))
		bobs_bits=[1,1,1];
	else
		b1
		error("Matrix b1 is not a projective operator")	
	endif
	
	ret=(alices_bits(b)==bobs_bits(a));	
endfunction
