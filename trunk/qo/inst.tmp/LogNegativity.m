%% -*- texinfo -*-
%% @deftypefn {Function file} {} LogNegativity(@var{state},@var{qlist})
%% Function @code{LogNegativity} returns negativity defined for state
%% @var{state} as @code{LogNegativity(state,qlist) = 1/2*(TrNorm(PTranspose(state,qlist) - 1)}. 
%% Partial transposition is performed over qubits listed in @var{qlist}.
%% 
%% @example 
%% @group
%% LogNegativity(State(Ket([0,0,0]),[1,2])
%%  @result{} 
%%	0
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {Negativity, Entropy, PTrace, PTranspose, Entropy, TrNorm}
%%

function ret = LogNegativity(state, qlist)
if ( nargin != 2)
	usage ('Negativity (state, qubits)');
end
	ret = log2(TrNorm(PTranspose(state,qlist))); 
end
