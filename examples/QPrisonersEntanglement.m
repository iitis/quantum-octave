function [neg, ent] = QPrisonersEntanglement(l)
	D = 0.5*l*i*Kron(Sx,Sx);
	mJ = expm(D);

	st = State(KetN(0,2));
	tmp = Evolve(mJ,st);

	neg = Negativity(tmp,[1]);
	ent = Entropy(PTrace(tmp,[1]));
endfunction

