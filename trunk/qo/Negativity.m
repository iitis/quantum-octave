## -*- texinfo -*-
## @deftypefn {Function file} {} Negativity(@var{state},@var{qlist})
## Function @code{Negativity} returns negativity defined for state
## @var{state} as @code{Negativity(state) = 1/2*(TrNorm(PTranspose(state,qlist) - 1)}. 
## Partial transposition is performed over qubits listed in @var{qlist}.
## This quantity is one of tools implemented in quantum-octave 
## for entanglment analysis.
## 
## @example 
## @group
## Negativity(State(Ket([0,0,0]))
##  @result{} 
##	0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {PTrace, PTranspose, Entropy, TrNorm}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 26 March 2004

function ret = Negativity(state, qlist);
if ( nargin != 2)
	usage ("Negativity (state, qubits)");
endif
	ret = 0.5*(TrNorm(PTranspose(state,qlist)) - 1); 
endfunction
