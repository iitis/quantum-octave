## -*- texinfo -*-
## @deftypefn {Function file} {} CNot(@var{size},@var{contrv},@var{targetv})
## Function @code{CNot} returns controled Not operation on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  CNot (2,[2],[1])
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
## @seealso {Not, ControledGate}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 23 February 2003
##
## Last modification : 25 March 2004

function ret = CNot(size,contrv,targetv)

ret = ControlledGate(size, Not, contrv, targetv );

endfunction
