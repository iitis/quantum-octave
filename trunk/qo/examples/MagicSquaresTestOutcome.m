function ret=MagicSquaresTestOutcome(a,b, eigvals)

	alices_eigs=-(eigvals(1:2)-0.5);
	bobs_eigs=-(eigvals(3:4)-0.5);

	if alices_eigs==[0,0]
		alices_bits=[0,0,0];
	elseif alices_eigs==[0,1]
		alices_bits=[0,1,1];
	elseif alices_eigs==[1,0]
		alices_bits=[1,0,1];
	elseif alices_eigs==[1,1]
		alices_bits=[1,1,0];
	else
		error("FLEE!!");
	endif	

	if bobs_eigs==[0,0]
		bobs_bits=[0,0,1];
	elseif bobs_eigs==[0,1]
		bobs_bits=[0,1,0];
	elseif bobs_eigs==[1,0]
		bobs_bits=[1,0,0];
	elseif bobs_eigs==[1,1]
		bobs_bits=[1,1,1];
	else
		error("FLEE!!");
	endif

	ret=(alices_bits(b)==bobs_bits(a));
endfunction