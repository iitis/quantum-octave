## -*- texinfo -*-
## @deftypefn {Function File} {} ErrorY (@var{epsilon})
## The @code{ErrorY} function returns matrix 
## which represents phaseflip error with given probability.
##
## @example
## @group
## ErrorY(0.1)
## @result{}	
##	0.90000  0.10000
##	0.10000  0.90000
## @end group
## @end example
## @end deftypefn
## @seealso{Id, H, Phase, RotX, RotY, RotZ}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = ErrorY(epsilon)
if (nargin != 1)
	usage(ErrorY(epsilon));
endif
if(epsilon <0 || epsilon>1)
	error("Parameter shoold be in [0,1]!");
endif
	ret = epsilon*i*Sx*Sz + (1 - epsilon)*Id;
endfunction
