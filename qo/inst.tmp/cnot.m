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

function ret = cnot(size,contrv,targetv)
	if (nargin ~= 3) 
		usage ('cnot (size, controls, targets)');
	endif
	ret = controlledgate(size, sx, contrv, targetv);
endfunction