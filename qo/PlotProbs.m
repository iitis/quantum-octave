## -*- texinfo -*-
## @deftypefn{Function file} {} Name([@var{size}] )
## Function @code{Id(@var{size})} returns 2^size x 2^size dentity
## matrix, argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## Name(2)
##  @result{}
##	1  0  0  0 
##	0  1  0  0
##	0  0  1  0
##	0  0  0  1
## @end group
## @end example
## @end deftypefn
## @seealso {Id, Not, H, Pase}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 4 January 2004

function PlotProbs(probs)
#TODO need checking if probs are valid

#If probs is column vector we suppose that's state vector
if(size(probs)(2)==1)
	probs = abs(probs).^2
	plot(probs,"^");
#If probs is to column vector we suppose that's measure outcom
elseif(size(probs)(2)==2)
	plot(probs(:,1),probs(:,2),"^");
#else it's an error
else
	error("Wrong input");
endif
endfunction

