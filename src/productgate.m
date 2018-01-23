## -*- texinfo -*-
## @deftypefn {Function file} {} productgate(@var{gatesize},@var{gate},@var{targetv})
## Function @code{productgate} generates operator of size equal 2^@var{gatesize}.
## Parameter @var{gate} is 2x2 basic operator (ex. Not). Paramter
## @var{targetv} is list of indices of target qubits.
##
## @example 
## @group
## productgate(Not,[1,2],gatesize)
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

function ret = productgate(gate,targetv,gatesize)
	if (nargin==2 || isempty(gatesize))
		global quantum_octave_state;
		gatesize=log2(size(quantum_octave_state,1));
	endif

	if(nargin<2 || nargin>3)
		usage("productgate(gate,targetv,gatesize)")
	endif
	if(!is_scalar(gatesize))
			error('productgate: last parameter should be scalar!');
	endif
	
	if(is_square(gate)!=2)
			error('productgate: first parameter should be matrix 2x2!');
	endif
	
	if(gatesize < max(targetv))
			error('productgate: Operator acts on %d qubits, max target index is %d!', gatesize, max(targetv));
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
	
	for i = 2:gatesize
			if((idx <= length(lv)) && (lv(idx) == i))
					tmp = __kron(tmp,gate);
					idx=idx+1;
			else
					tmp = __kron(tmp,id(1));
			endif
	endfor
	
	ret = tmp;
	
endfunction