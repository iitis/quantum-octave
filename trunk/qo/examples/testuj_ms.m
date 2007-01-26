function ret=testuj_ms(errType,noExp,noRates,type)

	if(nargin<1)
		message = [ 
			"testuj_ms(noRates, [noExp, errGate, type])\n"\
			"\tnoRates - number of error rates for calculating output\n"\
			"\tnoExp - number of experiments for each rate\n"\
			"\terrGate - error used (defualt - dephasing chanell)\n"\
			"\ttype - 'fid' for calculating fidelity of 'exp' for full game "];
		usage(message);
	else

        	# number of experiments
	        MAX = noExp;
        	# number of error rates tested
	        TRY = noRates;

        	ret = zeros(TRY,1);

                for p = 0:TRY
                        seg=(1-p/TRY)*Id(1)+(p/(3*TRY))*(Sx+Sy+Sz);
                        error_gate=ProductGate(4,seg,[2,3]);
                        wynik=zeros(MAX,1);
                        if param=="fid"
                                wynik=MagicSquaresFidelity(3,1, error_gate);
                                ret(p+1,1)=p/TRY;
                                ret(p+1,2)=wynik;
                        elseif param=="exp"
                                for i = 1:MAX
                                        wynik(i)=MagicSquares(3,1, error_gate);
                                        printf("p=%d, i=%d\n",p,i);
                                endfor
                                ret(p+1,1)=p/TRY;
                                ret(p+1,2)=mean(wynik);
                        else
                                error("param != exp or fid");
                        endif
                endfor
	endif
	
endfunction
