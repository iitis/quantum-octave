## -*- texinfo -*-
## @deftypefn {Function file} {} productgate(@var{size},@var{gate},@var{targetv})
## Function @code{productgate} generates operator of size equal 2^@var{size}.
## Parameter @var{gate} is 2x2 basic operator (ex. Not). Paramter
## @var{targetv} is list of indices of target qubits.
##
## @example 
## @group
## productgate(3,Not,[1,2])
##  @result{}
## 0  0  0  0  0  0  1  0
## 0  0  0  0  0  0  0  1
## 0  0  0  0  1  0  0  0
## 0  0  0  0  0  1  0  0
## 0  0  1  0  0  0  0  0
## 0  0  0  1  0  0  0  0
## 1  0  0  0  0  0  0  0
## 0  1  0  0  0  0  0  0
##
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {controlledgate, id, sx, h, phase}
##

function ret = productgate(size,gate,targetv)
	if(nargin~=3)
		help productgate;
		return;
	endif
	if(~is_scalar(size))
			error('productgate: 1st parameter should be scalar!');
	endif
	
	if(is_square(gate)!=2)
			error('productgate: 2nd parameter should be matrix 2x2!');
	endif
	
	if(size < max(targetv))
			error('productgate: Operator acts on %d qubits, max target index is %d!', size, max(targetv));
	endif
	if (min(targetv)<1)
			error('productgate: Qubit index less than 0!');
	endif
	
	idx = 1;
	lv = sort(targetv);
	if (lv(1) == 1)
			tmp = gate;
			idx=idx+1;
	else
			tmp = id(1);
	endif
	
	for i = 2:size
			if((idx <= length(lv)) && (lv(idx) == i))
					tmp = __kron(tmp,gate);
					idx=idx+1;
			else
					tmp = __kron(tmp,id(1));
			endif
	endif
	
	ret = tmp;
	
endfunction