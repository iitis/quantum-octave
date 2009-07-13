## -*- texinfo -*-
## @deftypefn {Function file} {} cphase(@var{phase},@var{contrv},@var{targetv},@var{size})
## Function @code{cphase} returns controled phase rotation by @var{phase} on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @end deftypefn
##
## @seealso {phase, controlledgate, cnot}
##

function ret = cphase(alpha,contrv,targetv,gatesize)
	if ( nargin < 3 ) 
		usage ('cphase(alpha,contrv,targetv[,gatesize])');
	endif
	
	p = phase(0,alpha);
	
	if ( nargin==3 )
		ret = controlledgate(p, contrv, targetv);
	else
		ret = controlledgate(p, contrv, targetv,gatesize);
	endif
endfunction
