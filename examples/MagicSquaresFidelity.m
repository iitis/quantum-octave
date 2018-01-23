function ret =  MagicSquaresFidelity(a,b,error_gate)

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

	s = State(inState);
	s1 = Evolve(gameMtx,s);
	s2 = Evolve(error_gate,s1);
	
	ret=Fidelity(s1,s2);
endfunction

