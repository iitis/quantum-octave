## -*- texinfo -*-
## @deftypefn {Function file} {} PTranspose(state, targv)
## Function @code{PTrace} returns density matrix obtained
## from matrix @var{state} by performing transposintion on 
## subspaces of qubits listed in @var{targv}.
##
## @example 
## @group
## PTranspose(State(Ket([0,0,0])),[1,2])
##  @result{} 
##	
##	
##
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ProductGate, PTrace}
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 22 March 2004

function ret = PTranspose(state,tqidx)
if (nargin != 2)
	usage ("PTranspose (state, qubits_vector)");
endif

ss = size(state)(2); # dimension of matrix state - always power of 2
sq = log2(ss); # numer of qubits in matrix state

tq = size(tqidx)(2); # number of qubits to transpose
ts = 2^tq; # dimension of space to transpose

rq = sq - tq; # number of qubits which are not filipped

if ( rq < 0 )
	error ("To many qubits in transposition vector!");
endif

# compute binary mask
mask_dec = sum(2.^(tqidx-1)); # sum powers of 2 in tqdix
mask_bin = Dec2BinVec(mask_dec,tq); # wher to flip elements
if (sq-tq > 0)
	comp = Dec2BinVec(0,sq-tq); # other elements of mask are zero
	mask = BuildBinaryVector(tqidx,mask_bin,comp,sq);
else 
	mask = mask_bin;
endif

ret = zeros (ss); # inicialize returned density matrix

# loop over every matrix emelent of returned density matrix
for i = 1:ss
	for j = 1:ss
		bi = Dec2BinVec(i - 1, sq);
		bj = Dec2BinVec(j - 1, sq);
		# loop over flips mask
		rbi = bi;
		rbj = bj;
		for ii = 1:sq
			if (mask(ii) == 1)
				# flip bits
				rbi(ii) = bj(ii); 
				rbj(ii) = bi(ii);
			endif
		endfor
		ri = BinVec2Dec(rbi) + 1;
		rj = BinVec2Dec(rbj) + 1;
		ret(i,j) = state(ri,rj);
	endfor
endfor
endfunction
