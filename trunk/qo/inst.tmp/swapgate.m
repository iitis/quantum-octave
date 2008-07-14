## -*- texinfo -*-
## @deftypefn {Function file} {} swapgate(size, qubits)
## Function @code{swapgate} returns swapgate operation on 
## @var{size} qubits exchanging qubits specified in 
## @var{qubits}. Note that exacly two qubits must be
## specified.
##
## @example 
## @group
## swapgate(2,[1,2])
##  @result{} 
## 1   0   0   0
## 0   0   1   0
## 0   1   0   0
## 0   0   0   1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {cnot, controlledgate}
##

function ret = swapgate(s, qubits)
if (nargin !=2)
	usage('swapgate(size, qubits)');
endif
if (size(qubits,2)~=2)
	error('Only exactly 2 qubits can be swapgateed!');
endif

if ( ( qubits(1) > s || qubits(2) > s ))
	error('Qubit index out of bound!');
endif

if (qubits(1)==qubits(2))
	ret = id(s);
else
	g1 = cnot(s, qubits(1), qubits(2));
	g2 = cnot(s, qubits(2), qubits(1));
	g3 = cnot(s, qubits(1), qubits(2));

	ret = circuit(g1,g2,g3);
endif

endfunction