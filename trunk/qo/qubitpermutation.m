function ret=qubitpermutation(permutation)
	N=length(permutation);
	if (sum(sort(permutation)-[1:N])!=0)
		error("qubitpermutation: argument has to be vector containing uniq instatnces of 1 ... N")
	endif

	ret=qzeros(2^N);
	for i=[0:2^N-1]
		old=dec2binvec(i,N);
		new=zeros(1,N);
		for j=[1:N]
			new(j)=old(permutation(j));
		endfor
		ret(binvec2dec(new)+1,binvec2dec(old)+1)=1;
	endfor
endfunction