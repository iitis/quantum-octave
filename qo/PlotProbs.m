## -*- texinfo -*-
## @deftypefn{Function file} {} PlotProbs(@var{})
## Function @code{PlotProbs(@var{size})}
## 
## @example 
## @group
## PlotProbs()
##  @result{}
##
## @end group
## @end example
## @end deftypefn
## @seealso {Id, Not, H, Pase}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak.
## Created: 4 January 2004.

function PlotProbs(probs)
#TODO need checking if probs are valid

#If probs is column vector we suppose that's state vector
if(size(probs)(2)==1)
	plot([0:length(probs)-1],abs(probs).^2,"^");
#If probs is to column vector we suppose that's measure outcome
elseif(size(probs)(2)==2)
	plot(probs(:,1),probs(:,2),"^");
#else it's an error
else
	error("Wrong input");
endif
endfunction
