## -*- texinfo -*-
## @deftypefn {Function file} {} roty(@var{real})
## Function @code{roty} returns 2x2 matrix, that is
## 
## @example 
## @group
## roty(pi/2)
##  @result{} 
## 0.70711  -0.70711
## 0.70711   0.70711
## @end group
## @end example
##
## @end deftypefn
## 

function ret = roty(th)
	if (nargin!=1 || !is_scalar(th))
		usage ("roty(th)");
	else
    ret = [cos(th/2),-sin(th/2);sin(th/2),cos(th/2)];
	endif
endfunction