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

function ret = qif(gatesize,contrv,ifpart,elsepart)
 	if(nargin<3 || nargin>4)
 		usage('qif(gatesize,contrv,ifpart,elsepart)');
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

	cir=controlledgate(gatesize,ifpart{1},contrv,ifpart{2});
	if (nargin==4)
		for i=[1:length(contrv)] # iterate over all combinations of contrv
			v=combs(contrv,i);
			for j=[1:size(v)(1)]
 				cir=circuit(cir,productgate(gatesize,sx,v(j,:)));
			endfor
		endfor
	cir=circuit(cir,controlledgate(gatesize,elsepart{1},contrv,elsepart{2}));
	endif
 	ret=cir;
endfunction