## -*- texinfo -*-
## @deftypefn {Function file} {} partialtranspose(state, targv)
## Function @code{partialtranspose} returns density matrix obtained
## from matrix @var{state} by performing transposintion on 
## subspaces of qubits listed in @var{targv}.
##
## @example 
## @group
## partialtranspose(State(GHZ),[1,2])
##  @result{} 
##	0.50000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000
##	0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.50000  0.00000
##	0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000
##	0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000
##	0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000
##	0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000
##	0.00000  0.50000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000
##	0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.00000  0.50000
##				 
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {partialtrace, vnentropy}
##

function ret = partialtranspose(state,tqidx)
	if (nargin ~= 2)
		usage ('partialtranspose (state, qubits_vector)');
	endif
	
	# calculate some parameters
	ss = size(state,2); # dimension of matrix state - always power of 2
	sq = log2(ss); # numer of qubits in matrix state
	
	tq = size(tqidx,2); # number of qubits to transpose
	ts = 2^tq; # dimension of space to transpose
	
	rq = sq - tq; # number of qubits which are not filipped
	
	if ( rq < 0 )
		error ('partialtranspose: To many qubits in transposition vector!');
	endif
	
	if ( max(tqidx) > sq || min(tqidx) < 1 )
		error ('partialtranspose: Transposition index is out of bound!');
	endif
	
	# where to flip elements
	mask = zeros(sq,1);
	for mi = 1:tq
		mask(tqidx(mi)) = 1;
	endfor
	
	ret = zeros (ss); # initialize returned density matrix
	
	# loop over every matrix emelent of returned density matrix
	for i = 1:ss
		for j = 1:ss
			bi = dec2binvec(i - 1, sq);
			bj = dec2binvec(j - 1, sq);
			# loop over flips mask
			rbi = bi;
			rbj = bj;
			for ii = 1:sq
				if ( mask(ii) == 1)
					# flip bits
					rbi(ii) = bj(ii); 
					rbj(ii) = bi(ii);
				endif
			endfor
			ri = binvec2dec(rbi) + 1;
			rj = binvec2dec(rbj) + 1;
			ret(i,j) = state(ri,rj);
		endfor
	endfor
endfunction
