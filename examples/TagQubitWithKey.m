## -*- texinfo -*-
## @deftypefn{Function file} {} TagQubitWithKey(@var{state},@var{gate},@var{key})
## Function @code{TaqQubits(@var{state},@var{gate},@var{key})} for 
## a given state @var{state} returns density matrix which represents 
## state with qubits listed in @var{list} tagged using qubit authentication algorithm with 
## gate @var{gate} and using @var{key} as entangled channel. Try
## @example 
## @group
## TagQubitWithKey(State(Ket([0])),CNot,PhiP)
## @end group
## @end example
## @end deftypefn
## @seealso {TagGate, TagGateWithError,  Fidelity}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 27 March 2004

function ret = TagQubitWithKey(state, gate, key)
if (nargin != 3)
	usage ("TagQubitsWithKey (state, gate, key)");
endif

P0 = Projection([0]);
P1 = Projection([1]);

key = State(key);
tag = State(Ket([0]));

trans = kron(kron(key, state), tag);

encgate = kron(kron(P0,Id), Id(2)) +  kron (kron(P1,Id), gate);

ret = Evolve(encgate, trans);
endfunction
