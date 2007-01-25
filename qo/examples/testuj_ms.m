function ret=testuj_ms()
	# number of experiments
	MAX = 1000;
	# number of error rates tested
	TRY = 100;
	
	ret = zeros(TRY,1);

	for p = 0:TRY
		wynik=zeros(MAX,1);
		for i = 1:MAX 
			wynik(i)=MagicSquares(3,1, (p/TRY)*Sx+(1-p/TRY)*Id(1), [1,2,3,4]); 
		endfor
		ret(p+1,1)=p/TRY;
		ret(p+1,2)=mean(wynik);
	endfor
	
endfunction