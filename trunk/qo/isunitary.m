function ret = isunitary(matrix)
matrix*conj(matrix)
norm((matrix*conj(matrix))-eye(size(matrix)),"fro")
	if(size(matrix)(1)!=size(matrix)(2))
		ret = 0;
		return;
	elseif(norm((matrix*conj(matrix))-eye(size(matrix)),"fro")<1e-15)
		ret = 1;
		return;
	else
		ret = 0;
		return;
	endif

endfunction