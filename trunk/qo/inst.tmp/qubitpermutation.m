function ret=qubitpermutation(permutation)
	N=length(permutation);
	if (sum(sort(permutation)-[1:N])!=0)
		error("qubitpermutation: argument has to be vector containing uniq instatnces of 1 ... N")
	endif

	global quantum_octave_sparse;
	if (exist("quantum_octave_sparse") && quantum_octave_sparse==true)
		ret= sparse(2^N,2^N);
	else
		ret= zeros(2^N);
	endif
	for i=[0:2^N-1]
		old=dec2binvec(i,N);
		new=zeros(1,N);
		for j=[1:N]
			new(j)=old(permutation(j));
		endfor
		ret(binvec2dec(new)+1,binvec2dec(old)+1)=1;
	endfor
endfunction