## -*- texinfo -*-
## @deftypefn {Function File} {} ErrorZ (@var{epsilon})
## The @code{ErrorZ} function returns matrix 
## which represents phaseflip error with given probability.
##
## @example
## @group
## ErrorZ(0.1)
## @result{}	
##  	1.00000  0.00000
## 	0.00000  0.80000
## @end group
## @end example
## @end deftypefn
## @seealso{Id, H, Phase, RotX, RotY, RotZ}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = ErrorZ(epsilon)
if (nargin != 1)
	usage(ErrorZ(epsilon));
endif
if(epsilon <0 || epsilon>1)
	error("Parameter shoold be in [0,1]!");
endif
	ret = (epsilon) * Sz + (1-epsilon) * Id;
endfunction
