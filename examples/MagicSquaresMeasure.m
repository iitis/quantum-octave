function ret =  MagicSquaresMeasure(a,b,error_probX,error_probZ,measure)

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
	
#	gm{1,1}=kron(Id(1),Sz);
#	gm{1,2}=kron(Sz,Id(1));
#	gm{1,3}=kron(Sz,Sz);
#	gm{2,1}=kron(Sx,Id(1));
#	gm{2,2}=kron(Id(1),Sx);
#	gm{2,3}=kron(Sx,Sx);
#	gm{3,1}=kron(Sx,Sz);
#	gm{3,2}=kron(Sz,Sx);
#	gm{3,3}=kron(Sy,Sy);

	inState = 1/2*Ket([0 0 1 1]) - 1/2*Ket([0 1 1 0]) - 1/2*Ket([1 0 0 1]) + 1/2*Ket([1 1 0 0]);

	switch a
		case { 1 } gameMtx = A1;
		case { 2 } gameMtx = A2;
		case { 3 } gameMtx = A3;
	end

	switch b
		case { 1 } gameMtx = Kron(gameMtx,B1);
		case { 2 } gameMtx = Kron(gameMtx,B2);
		case { 3 } gameMtx = Kron(gameMtx,B3);
	end
	

## EVOLUTION ##

	s0 = State(inState);
	s1 = Evolve(gameMtx,s0);

	#quantum_operators={sqrt(error_prob)*Id(1), sqrt(1-error_prob)*Sz};

	#Ad1 = [1, 0; 0, sqrt(1-error_probX) ];
	#Ad2 = [0, sqrt(error_probX) ; 0, 0 ];
	#quantum_operators={Ad1, Ad2};
	
	Dc1 = sqrt(1-3*error_probX/4)*Id(1);
	Dc2 = sqrt(error_probX/4)*Sx;
	Dc3 = sqrt(error_probX/4)*Sy;
	Dc4 = sqrt(error_probX/4)*Sz;
	quantum_operators={Dc1, Dc2, Dc3, Dc4};

	#Dc1 = sqrt(1-error_probX/3-error_probZ/3)*Id(1);
	#Dc2 = sqrt(error_probX/3)*Sx;
	#Dc3 = sqrt(error_probZ/3)*Sz;
	#quantum_operators={Dc1, Dc2, Dc3};

	s0_noisy = Channel(s0, quantum_operators);
#	s0_noisy = error_probX*Id(4)+(1-error_probX)*s0;
	s1_noisy = Evolve(gameMtx,s0_noisy);

## END OF EVOLUTION ##
	
	if (nargin<4)
		measure="fid"
	end	
	ret=0;
	if (measure=="fid")
		ret=Fidelity(s1,s1_noisy);
	elseif (measure=="trn")
		if (s1==s1_noisy)
			ret=0;
		else 
			ret=TrNorm(s1-s1_noisy);
		endif
	elseif (measure=="ent")
		m=PTraceMul(s0_noisy, [1,2]);
		ret=Entropy(m);
	elseif (measure=="neg")
		ret=Negativity(s0_noisy, [1,2]);
	elseif (measure=="prb")
		m=Measure(s1_noisy,"ZZZZ","struct");
		p=0;
		for i=[1:16]
			if (MagicSquaresTestOutcome(a,b,m(i).out)==1)
				fflush(1);
				p+=m(i).p;
			endif
		endfor
		ret=p;
	endif
endfunction

