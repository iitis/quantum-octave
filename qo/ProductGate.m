## -*- texinfo -*-
## @deftypefn ProductGate(@var{size},@var{gate},@var{targetv} )
## Function @code{ProductGate} generates operator of size equal 2^@var{size}.
## Parameter @var{gate} is 2x2 basic operator (ex. Not). Paramter
## @var{targetv} is list of indices of target qubits.
## @end deftypefn

## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = ProductGate(size,gate,targetv)
if(nargin!=3)
	usage("ProductGate(size,gate,targetv)");
endif
if(!is_scalar(size))
	error("1st parameter should be scalar");
endif
if(is_square(gate)!=2)
	error("2nd parameter should be matrix 2x2");
endif
if(size < max(targetv))
	error("Operator acts on %d qubits, max target index is %d", size, max(targetv));
endif
if (min(targetv)<1)
	error("Qubit index less than 0");
endif

idx = 1;
sort(targetv);
if (targetv(1) == 1)
	tmp = gate;
	idx++;
else
	tmp = Id(1);
endif

for i = 2:size
if((idx <= length(targetv)) && (targetv(idx) == i))
	tmp = kron(tmp,gate);
	idx++;
else
	tmp = kron(tmp,Id(1));
endif

endfor
ret = tmp;
endfunction