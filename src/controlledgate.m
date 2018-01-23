## -*- texinfo -*-
## @deftypefn {Function file} {} controlledgate(@var{gate},@var{contrv},@var{targetv},@var{size},)
## Function @code{controlledgate} returns controled operation @var{gate} on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  controlledgate (2,Not,[1],[2])
##  @result{} 
##  1  0  0  0  
##  0  1  0  0  
##  0  0  0  1
##  0  0  1  0  
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {id, sx, h, rotx, roty, rotz}
##

function ret = controlledgate(gate,contrv,targetv,gatesize)
	if (nargin==3 || isempty(gatesize))
		global quantum_octave_state;
		gatesize=log2(size(quantum_octave_state,1));
	endif
	if(nargin<3 || nargin>4)
		usage('controlledgate(gate,contrv,targetv[,gatesize])');
	endif
	if(!isscalar(gatesize))
		error('controlledgate: 1st parameter should be scalar!');
	endif
	if(size(gate)~=[2,2])
		error('controlledgate: 2nd parameter should be matrix 2x2!');
	endif
	if(gatesize < max(max(contrv),max(targetv)))
		error('controlledgate: Operator acts on %d qubits, max control index is %d, max target index is %d!', gatesize, max(contrv), max(targetv));
	endif
		

	proj0 = [1,0;0,0];
	proj1 = [0,0;0,1];
	
	# sort input
	lc = sort(contrv); # control list
	lt = sort(targetv); # targe list
	
	flags = zeros(1,gatesize);
	
	for i = 1:length(lc)
		ctmp = lc(i);
		flags(ctmp) = 1; # control==1
	endfor
	
	for i = 1:length(lt)
		ttmp = lt(i);
		if (flags(ttmp) == 1)
			error('Arguments overlaping!');
			return;
		else
			flags(ttmp) = 2;  # target==2
			endif
	endfor
	
	# initialization
	ret = id(gatesize);
	
	# matrix building - case |111...>
	tmp = 1;
	
	for i = 1:gatesize
		if (flags(i) == 1)
			tmp = __kron(tmp,proj1);
		elseif (flags(i) == 2)
			tmp = __kron(tmp,gate);
		elseif (flags(i) == 0)
			tmp = __kron(tmp,id(1));
		else
			error('Internal error occured, it should never happen :-(!');
		endif
	endfor
	
	ret = tmp;

	#matrix building - other cases
	tmp=1;
	for j = 0:2^(size(lc,2))-2 # for each control qubit
	#genereate permutation of 0 and 1
	perm = dec2binvec(j,size(lc,2));
	pi=1; # permutation index
		for i = 1:gatesize
			if (flags(i) == 1) # it is control 
				if(perm(pi)==0)
					pi=pi+1;
					tmp = __kron(tmp,proj0);
				elseif(perm(pi)==1)
					pi=pi+1;
					tmp = __kron(tmp,proj1);
				else
					error('Internal error occured, it should never happen :-(!');				
				endif
			elseif (flags(i) == 2) # it is target, then put id
				tmp = __kron(tmp,id(1));
			elseif (flags(i) == 0)
				tmp = __kron(tmp,id(1));
			else
				error('Internal error occured, it should never happen :-(!');
			endif
		endfor
	ret = ret + tmp;
	tmp=1;
	endfor

endfunction