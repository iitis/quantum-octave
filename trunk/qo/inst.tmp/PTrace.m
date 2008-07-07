%% -*- texinfo -*-
%% @deftypefn {Function file} {} PTrace(state, targv)
%% Function @code{PTrace} returns density matrix obtained
%% from matrix @var{state} by tracing out subspace of qubits
%% listed in @var{targv}. This function uses matrix 
%% multiplication.
%%
%% @example 
%% @group
%% PTrace(State(Ket([0,0,0])),[1,2])
%%  @result{} 
%%	1 0
%%	0 0
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {ProductGate, PTranspose}
%%

function ret = PTrace(state,tqidx)
if ( nargin ~= 2 )
	usage ('PTraceMul (state, trace_qubits)');
end

targv = sort(tqidx); % must be sorted!

ss = size(state,2); % dimension of matrix state - always power of 2
sq = log2(ss); % number of qubits in matrix state

tq = size(targv,2); % number of qubits to trace-out
ts = 2^tq; % dimension of space to trace out

rq = sq - tq; % calculate number of qubits in returned density matrix
rs = 2^rq; % calculate size of returned density matrix

ret = zeros (rs); % initialise returned density matrix

% loop over every matrix emelent of returned density matrix
for i = 1:rs
	for j = 1:rs
		bi = Dec2BinVec(i-1,rq); % those have to be row vectors
		bj = Dec2BinVec(j-1,rq);

	% sum loop over elements of targv list
		for k = 0:ts-1
			bk = Dec2BinVec(k,tq);
			BRA = Ket(BinVec(targv,bk,bi,sq))';
			KET = Ket(BinVec(targv,bk,bj,sq));
			ret(i,j) = ret(i,j) + BRA*(state*KET);
		end
	end
end

end
