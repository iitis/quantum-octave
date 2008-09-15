## -*- texinfo -*-
## @deftypefn {Function file} {} controlledgate(@var{size},@var{gate},@var{contrv},@var{targetv})
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
#### qif(qrlt([1,2],5),{sx,3},{sy,4})
function ret = qif(contrexp,ifpart,elsepart,gatesize)
 	if(nargin<3 || nargin>4)
 		usage('qif(contrexp,ifpart,elsepart[,gatesize])');
# 	endif
# 	if(!isscalar(gatesize))
# 		error('controlledgate: 1st parameter should be scalar!');
# 	endif
# 	if(size(gate)~=[2,2])
# 		error('controlledgate: 2nd parameter should be matrix 2x2!');
# 	endif
# 	if(gatesize < max(max(contrv),max(targetv)))
# 		error('controlledgate: Operator acts on %d qubits, max control index is %d, max target index is %d!', gatesize, max(contrv), max(targetv));
 	endif
	GATE=1;
	TARGET=2;
	REGISTER=contrexp.register;
	if (nargin==3 || isempty(gatesize))
		global quantum_register_allocated ;
		gatesize=length(quantum_register_allocated);
	endif

	cir=id(gatesize);

	for i=[1:length(contrexp.t)]
		s=setdiff(REGISTER,contrexp.t{i});
		if (length(s)!=0)
 			cir=circuit(cir,productgate(sx,s,gatesize));
		endif
		cir=circuit(cir,controlledgate(ifpart{GATE},REGISTER,ifpart{TARGET},gatesize));
		if (length(s)!=0)
			cir=circuit(cir,productgate(sx,s,gatesize));
		endif
endfor

	for i=[1:length(contrexp.f)] 
		s=setdiff(REGISTER,contrexp.f{i});
		if (length(s)!=0)
 			cir=circuit(cir,productgate(sx,s,gatesize));
		endif
			cir=circuit(cir,controlledgate(elsepart{GATE},REGISTER,elsepart{TARGET},gatesize));
		if (length(s)!=0)
 			cir=circuit(cir,productgate(sx,s,gatesize));
		endif
	endfor
 	ret=cir;
endfunction