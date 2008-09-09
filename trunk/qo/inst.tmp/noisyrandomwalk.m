function ret=noisyrandomwalk(walkersize,steps,channelname,p)
	st=state(kronp(state(normalize(ket([0])+i*ket([1]))),ketn(2^(walkersize-1),walkersize)));
	W=zeros(2^(walkersize+1));
	M=2^walkersize;
	for i=[0:M-1]
		W+=kronp(projection(0),ketn(mod(i-1,M),walkersize)*bran(i,walkersize))+kronp(projection(1),ketn(mod(i+1,M),walkersize)*bran(i,walkersize));
	endfor
	# initialization
	ret=zeros(2^walkersize,steps);
	if (nargin==2)
		for i=[1:steps]
			ret(:,i)=measurecompbasis(ptrace(st,[1]));
			st=evolve(productgate(h,1,walkersize+1),st);
			st=evolve(W,st);
		endfor
	endif

	if (nargin==4)
		for i=[1:steps]
			st=applychannel(localchannel(channel(channelname,p),[1],walkersize+1), st);
			ret(:,i)=measurecompbasis(ptrace(st,[1]));
			st=evolve(productgate(h,1,walkersize+1),st);
			st=evolve(W,st);
		endfor
	endif
endfunction