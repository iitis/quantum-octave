## -*- texinfo -*-
## @deftypefn{Function file} {} Id([@var{size}] )
## Function @code{Id(@var{size})} returns 2^size x 2^size dentity
## matrix, argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## Id(2)
##  @result{}
##	1  0  0  0 
##	0  1  0  0
##	0  0  1  0
##	0  0  0  1
## @end group
## @end example
## @end deftypefn
## @seealso {H, Not}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Id(varargin)
	if(nargin==1)
		di = va_arg();
		ret = eye(2^di);
	elseif(nargin==0)
		ret = eye(2);
	else
		error("No more the one argument can be suplied for this funcion")
	endif
endfunction
