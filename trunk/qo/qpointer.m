## -*- texinfo -*-
## @deftypefn {Function file} {} qpointer(@var{gate},@var{contrv},@var{targetv},@var{size},)
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

function ret = qpointer(gate,contrv,targetv,gatesize)
	if (nargin==3 || isempty(gatesize))
		global quantum_octave_state;
		gatesize=log2(size(quantum_octave_state,1));
	endif
	if(nargin<3 || nargin>4)
		usage('qpointer(gate,contrv,targetv[,gatesize])');
	endif
	if(!isscalar(gatesize))
		error('qpointer: 1st parameter should be scalar!');
	endif
	if(size(gate)~=[2,2])
		error('qpointer: 2nd parameter should be matrix 2x2!');
	endif
	if(gatesize < max(max(contrv),max(targetv)))
		error('qpointer: Operator acts on %d qubits, max control index is %d, max target index is %d!', gatesize, max(contrv), max(targetv));
	endif
	if(2^length(contrv)!=length(targetv))
		error('qpointer: Missmatching sizes of control of target registers. Size of control is %d. Size of target is %d!', length(contrv), length(targetv));
	endif

 	N=length(targetv);
	idx=[1:N];
	cir=id(gatesize);
	for i=idx
		cir=circuit(cir,qif(qreq(contrv,i-1),{gate,targetv(i)},{id,targetv(i)},gatesize));
	endfor
	ret=cir;
endfunction