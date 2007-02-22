## -*- texinfo -*-
## @deftypefn {Function file} {} PTrace(state, targv)
## Function @code{PTrace} returns density matrix obtained
## from matrix @var{state} by tracing out subspace of qubits
## listed in @var{targv}.
##
## @example 
## @group
## PTrace(State(Ket([0,0,0])),[1,2])
##  @result{} 
##	1 0
##	0 0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ProductGate, PTranspose}
##

function ret = PTrace(state,tqidx)
if ( nargin != 2 )
	error ("Wrong number of arguments!")
	usage ("PTrace (state, trace_qubits)");
	ret = -1
end

targv = sort(tqidx); # must be sorted!

# parameters of the input
ss = size(state)(2); # dimension of matrix state - always power of 2
sq = log2(ss); # number of qubits in matrix state

# parameters of the operation
tq = size(targv)(2); # number of qubits to trace-out
ts = 2^tq; # dimension of space to trace out

# parameters of the output
rq = sq - tq; # calculate number of qubits in returned density matrix
rs = 2^rq; # calculate size of returned density matrix

ret = zeros (rs); # initialise returned density matrix

# loop over every matrix element of returned density matrix
for i = 1:rs
	for j = 1:rs
		# row (bi) and column (bj) of the returned density matrix
		bi = Dec2BinVec(i-1,rq);
		bj = Dec2BinVec(j-1,rq);

		# sum loop over elements of targv list
		for k = 0:ts-1
			bk = Dec2BinVec(k,tq);
			# we have to count starting form 1 
			idx1 = BinVec2Dec(BinVec(targv,bk,bi,sq)) + 1;
			idx2 = BinVec2Dec(BinVec(targv,bk,bj,sq)) + 1;
			ret(i,j) += state (idx1,idx2);
		end
	end
end
end
