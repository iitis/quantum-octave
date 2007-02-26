function ret=RunMagicSquaresGame(game,noRates,expType)
	if(nargin<1)
		error("WRITE ME!!!");
	else
		ret = zeros(noRates,1);
		for px = 0:noRates
			for pz = 0:noRates
				outcome=0;
				error_probX=px/noRates;
				error_probZ=pz/noRates;
				outcome=MagicSquaresMeasure(game(1),game(2), error_probX, 0, expType);
				ret(px+1,pz+1)=outcome;
			endfor
		endfor
	endif
endfunction