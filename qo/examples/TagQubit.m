## -*- texinfo -*-
## @deftypefn{Function file} {} TagQubits(@var{state},@var{gate})
## Function @code{TaqQubits(@var{state},@var{gate})} for 
## a given state @var{state} returns density 
## matrix which represents state with qubits listed in @var{list} 
## tagged using qubit authentication algorithm.
## Matrix  @var{gate} specifies algorithm. Try:
## @example 
## @group
## TagQubit(State(Ket([0])),Not)
## @end group
## @end example
## @end deftypefn
## @seealso {ProductGate, ControlledGate, Encode, Decode, Recover, Fidelity}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 27 March 2004

function ret = TagQubit(state, gate)
if (nargin != 2)
	usage ("TagQubits (state, gate)");
endif

P0 = Projection([0]);
P1 = Projection([1]);

key = State(PsiM);
tag = State(Ket([0]));

trans = kron(kron(key, state), tag);

encgate = kron(kron(P0,Id), Id(2)) +  kron (kron(P1,Id), gate);

ret = Evolve(encgate, trans);
endfunction
