## -*- texinfo -*-
## @deftypefn{Function file} {} TagQubits(@var{state},@var{gate},@var{list})
## Function @code{TagQubits(@var{gate},@var{list})} for a given state @var{state} returns density 
## matrix which represents state with qubits listed in @var{list} 
## tagged using qubit authentication algorithm.
## Matrix  @var{gate} specifies algorithm.
## @end deftypefn
## @seealso {ProductGate, ControlledGate, Encode, Decode, Recover}
## 

function ret = CheckTag(state, gate)
if (nargin != 2)
	usage ("CheckTag (state, gate)");
endif

P0 = Projection([0]);
P1 = Projection([1]);

key = State(PsiM);
tag = State(Ket([0]));

decgate = kron(kron(Id,P0), gate') +  kron (kron(Id,P1), Id(2));

ret = Evolve(decgate, state);

endfunction
