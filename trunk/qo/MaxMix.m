## -*- texinfo -*-
## @deftypefn{Function file} {} MaxMix([@var{size}])
## Function @code{Id(@var{size})} returns 2^@var{size} x 2^@var{size} 
## unitary matrix - that is matrix accting on @var{size} qubits.
## Argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## MaxMix(2)
##  @result{}
##	
## @end group
## @end example
## @end deftypefn
## @seealso {Not, H, Pase, Id}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 22 March 2004

function ret = MaxMix(varargin)
	if( nargin == 1)
		di = va_arg();
		ret = (1/2^di)*eye(2^di);
	elseif( nargin == 0)
		ret = (1/2)*eye(2);
	else
		usage("MaxMix([qubits])")
	endif
endfunction
