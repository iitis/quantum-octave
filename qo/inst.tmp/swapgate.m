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

function ret = swapgate(qubits, gatesize)
if (nargin !=2)
	usage('swapgate(qubits, gatesize)');
endif
if (size(qubits,2)~=2)
	error('swapgate: Only exactly 2 qubits can be swapgateed!');
endif

if ( ( qubits(1) > gatesize || qubits(2) > gatesize ))
	error('swapgate: Qubit index out of bound!');
endif

if (qubits(1)==qubits(2))
	ret = id(gatesize);
else
	g1 = cnot(qubits(1), qubits(2),gatesize);
	g2 = cnot(qubits(2), qubits(1),gatesize);
	g3 = cnot(qubits(1), qubits(2),gatesize);

	ret = circuit(g1,g2,g3);
endif

endfunction