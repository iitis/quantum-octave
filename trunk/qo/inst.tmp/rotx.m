## -*- texinfo -*-
## @deftypefn {Function file} {} rotx(@var{real})
## Function @code{rotx} returns 2x2 matrix, that is
## 
## @example 
## @group
## rotx(pi/2)
##  @result{} 
## 0.70711 + 0.00000i  0.00000 - 0.70711i
## 0.00000 - 0.70711i  0.70711 + 0.00000i
## @end group
## @end example
##
## @end deftypefn
## 

function ret = rotx(th)
	if (nargin!=1 || !is_scalar(th))
		usage ("rotx(th), th - real");
	else
    ret = [cos(th/2),-i*sin(th/2);-i*sin(th/2),cos(th/2)];
	endif
endfunction