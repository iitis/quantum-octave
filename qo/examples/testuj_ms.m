function ret=testuj_ms(errType,noExp,noTry)

	if(nargin!=3)
		usage("testuj_ms(errType, noExp, noTry)");
	else

		# number of experiments

		MAX = noExp;
		# number of error rates tested
		TRY = noTry;
	
		ret = zeros(TRY,1);

		for p = 0:TRY
			wynik=zeros(MAX,1);
			for i = 1:MAX 
				wynik(i)=MagicSquares(3,1, (p/TRY)*errType+(1-p/TRY)*Id(1), [1,2,3,4]); 
			endfor
			ret(p+1,1)=p/TRY;
			ret(p+1,2)=mean(wynik);
		endfor
	endif
	
endfunction
