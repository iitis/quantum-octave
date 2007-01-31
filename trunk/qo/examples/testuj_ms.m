function ret=testuj_ms(noExp,noRates,type,errIdx,errType)

	if(nargin<1 || nargin>5)
		message = [ 
			"testuj_ms(noExp,noRates,type,errIdx,errType)\n"\
			"\tnoRates - number of error rates for calculating output\n"\
			"\tnoExp - number of experiments for each rate\n"\
			"\ttype - 'fid' for calculating fidelity of 'exp' for full game\n"\
			"\terrType - error used (defualt - dephasing chanell)\n"\
			"\terrIdx - index of qubits affected by error"];
		usage(message);
	else
		# number of experiments
	  MAX = noExp;
    # number of error rates tested
	  TRY = noRates;

		ret = zeros(TRY,1);

		if (nargin>=4) 
			ERR_IDX=errIdx;
		else
			ERR_IDX=[1,2,3,4];
		endif

		for p = 0:TRY	
			if (nargin>4) # specific error type
					seg=(1-p/TRY)*Id(1)+(p/TRY)*errType;
			elseif	# default error type
				seg=(1-p/TRY)*Id(1)+(p/(3*TRY))*(Sx+Sy+Sz);
			endif

			error_gate=ProductGate(4,seg,ERR_IDX);
			wynik=zeros(MAX,1);
			
			if type=="fid"
				wynik=MagicSquaresFidelity(3, 1, error_gate);
				ret(p+1,1)=p/TRY;
				ret(p+1,2)=wynik;
			elseif type=="exp"
				for i = 1:MAX
					wynik(i)=MagicSquares(3, 1, error_gate);
					printf("p=%d, i=%d\n",p,i);
					fflush(1);
				endfor
				ret(p+1,1)=p/TRY;
				ret(p+1,2)=mean(wynik);
			else
				error("param != exp or fid");
			endif
		endfor

	endif
endfunction
