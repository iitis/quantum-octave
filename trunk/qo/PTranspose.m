## -*- texinfo -*-
## @deftypefn {Function file} {} PTranspose(state, targv)
## Function @code{PTranspose} returns density matrix obtained
## from matrix @var{state} by performing transposintion on 
## subspaces of qubits listed in @var{targv}.
##
## @example 
## @group
## PTranspose(State(GHZ),[1,2])
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
## @seealso {ProductGate, PTrace, Entropy, GHZ, W, Werner}
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 22 March 2004
##
## Last modyfication: 26 March 2004

function ret = PTranspose(state,tqidx)
if (nargin != 2)
	usage ("PTranspose (state, qubits_vector)");
endif

# calculate some parameters
ss = size(state)(2); # dimension of matrix state - always power of 2
sq = log2(ss); # numer of qubits in matrix state

tq = size(tqidx)(2); # number of qubits to transpose
ts = 2^tq; # dimension of space to transpose

rq = sq - tq; # number of qubits which are not filipped

if ( rq < 0 )
	error ("To many qubits in transposition vector!");
endif

if ( max(tqidx) > sq || min(tqidx) < 1 )
	error ("Transposition index is out of bound!");
endif

# where to flip elements
mask = zeros(sq,1);
for mi = 1:tq
	mask(tqidx(mi)) = 1;
endfor	

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
			if ( mask(ii) == 1)
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
