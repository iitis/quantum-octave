## -*- texinfo -*-
## @deftypefn{Function file} {} PlotProbs(@var{PROB})
## Function @code{PlotProbs(@var{PROBE})} plots probability 
## distribution. Performing measurment on quantum state you 
## obtain probability distribution. Try:
## @example 
## @group
## PlotProbs(Measure(State(Ket([0,1]))))
## PlotProbs(Measure(MixStates(1/2,State(Ket([0,1])),
## 				1/2,State(Ket([1,0]))
##			)))
##
## @end group
## @end example
## @end deftypefn
## @seealso {PrintAmps, PlotAmps, PrintProbs}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak.
## Created: 4 January 2004.

function PlotProbs(probs)
# TODO need checking if probs are valid

#temporary
#tmp=length(probs);
#gset mxtics 1
#gset xrange [-1:tmp+1]

#If probs is column vector we suppose that's state vector
if(size(probs)(2)==1)
	plot([0:length(probs)-1],abs(probs).^2,"^;Probabilities;");
#If probs is to column vector we suppose that's measure outcome
elseif(size(probs)(2)==2)
	plot(probs(:,1),probs(:,2),"^;Probabilities;");
#else it's an error
else
	error("Wrong input");
endif
endfunction
