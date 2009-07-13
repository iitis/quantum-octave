%% -*- texinfo -*-
%% @deftypefn {Function file} {} negativity(@var{state},@var{qlist})
%% Function @code{negativity} returns negativity defined for state
%% @var{state} as @code{negativity(state) = 1/2*(TrNorm(PTranspose(state,qlist)) - 1)}. 
%% Partial transposition is performed over qubits listed in @var{qlist}.
%% This quantity is one of tools implemented in quantum-octave 
%% for entanglment analysis.
%% 
%% @example 
%% @group
%% negativity(State(Ket([0,0,0]),1)
%%  @result{} 
%%	0
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {lognegativity, vnentropy, partialtrace, partialtranspose, tracenorm}
%%

function ret = negativity(state, qlist)
	if ( nargin != 2)
		usage ('negativity (state, qubits)');
	endif
	ret = 0.5*(tracenorm(partialtranspose(state,qlist)) - 1); 
endfucntion
