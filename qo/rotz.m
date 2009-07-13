## -*- texinfo -*-
## @deftypefn {Function file} {} rotz(@var{real})
## Function @code{rotz} returns 2x2 matrix, that is
## 
## @example 
## @group
## rotz(pi/2)
##  @result{} 
## 0.70711 - 0.70711i  0.00000 + 0.00000i
## 0.00000 + 0.00000i  0.70711 + 0.70711i
## @end group
## @end example
##
## @end deftypefn
## 

function ret = rotz(th)
	if (nargin!=1 || !is_scalar(th))
		usage ("rotz(th)");
	else
    ret = [exp(-i*th/2),0;0,exp(i*th/2)];
	endif
endfunction