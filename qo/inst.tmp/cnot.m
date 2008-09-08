## -*- texinfo -*-
## @deftypefn {Function file} {} cnot(@var{size},@var{contrv},@var{targetv})
## Function @code{cnot} returns controled Not operation on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  cnot (2,[2],[1])
##  @result{} 
##  1  0  0  0  
##  0  0  0  1  
##  0  0  1  0
##  0  1  0  0  
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {sx, controlledgate}
##

function ret = cnot(contrv,targetv,gatesize)
	if (nargin != 3) 
		usage ('cnot (controls, targets,gatesize)');
	endif
	ret = controlledgate(sx, contrv, targetv,gatesize);
endfunction