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
function ret = qif(gatesize,contrexp,ifpart,elsepart)
 	if(nargin<3 || nargin>4)
 		usage('qif(gatesize,contrexp,ifpart,elsepart)');
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
			cir=controlledgate(gatesize,ifpart{1},contrexp.register,ifpart{2});
			cir=circuit(cir,productgate(gatesize,sx,contrexp.t{i}));
		endif
	endfor

	if (nargin==4)
		for i=[1:length(contrexp.f)] 
			if (length(contrexp.f{i})!=0)
				cir=circuit(cir,productgate(gatesize,sx,contrexp.f{i}));
				cir=circuit(cir,controlledgate(gatesize,elsepart{1},contrexp.register,elsepart{2}));
				cir=circuit(cir,productgate(gatesize,sx,contrexp.f{i}));
			endif
		endfor
	endif
 	ret=cir;
endfunction