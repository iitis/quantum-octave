%% -*- texinfo -*-
%% @deftypefn {Function file} {} lognegativity(@var{state},@var{qlist})
%% Function @code{lognegativity} returns negativity defined for state
%% @var{state} as @code{lognegativity(state,qlist) = 1/2*(tracenrom(partialtranspose(state,qlist) - 1)}. 
%% Partial transposition is performed over qubits listed in @var{qlist}.
%% 
%% @example 
%% @group
%% lognegativity(state(ket([0,0,0]),[1,2])
%%  @result{} 
%%	0
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {negativity, vnentropy, partialtrace, partialtranspose, tracenorm}
%%

function ret = lognegativity(state, qlist)
	if ( nargin != 2)
		usage ('lognegativity(state, qubits)');
	endif
	ret = log2(tracenorm(partialtranspose(state,qlist))); 
endfunction
