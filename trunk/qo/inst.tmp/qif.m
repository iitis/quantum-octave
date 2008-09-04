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
#### qif(4,qrlt([1,2],5),{sx,3},{sy,4})
function ret = qif(contrexp,ifpart,elsepart,gatesize)
	if nargin==3
		gatesize=max(max([contrexp.register, ifpart{2}, elsepart{2}]))-min(min([contrexp.register, ifpart{2}, elsepart{2}]))+1;
	endif

 	if(nargin<3)
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

	cir=id(gatesize);
	for i=[1:length(contrexp.t)]
		if (length(contrexp.t{i})!=0)
			cir=circuit(cir,productgate(gatesize,sx,contrexp.t{i}));
			cir=circuit(cir,controlledgate(ifpart{1},contrexp.register,ifpart{2},gatesize));
			cir=circuit(cir,productgate(gatesize,sx,contrexp.t{i}));
		endif
	endfor

	for i=[1:length(contrexp.f)] 
		if (length(contrexp.f{i})!=0)
			cir=circuit(cir,productgate(gatesize,sx,contrexp.f{i}));
			cir=circuit(cir,controlledgate(elsepart{1},contrexp.register,elsepart{2},gatesize));
			cir=circuit(cir,productgate(gatesize,sx,contrexp.f{i}));
		endif
	endfor
 	ret=cir;
endfunction