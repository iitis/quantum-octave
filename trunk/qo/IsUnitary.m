function ret = isunitary(matrix)
	if(size(matrix)(1)!=size(matrix)(2))
		ret = 0;
		return;
	elseif(norm((matrix*matrix')-eye(size(matrix)),"fro")<1e-15)
		ret = 1;
		return;
	else
		ret = 0;
		return;
	endif
endfunction
