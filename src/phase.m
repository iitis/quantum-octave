## -*- texinfo -*-
## @deftypefn {Function File} {} phase (@var{phi0},@var{phi1})
## The @code{Phae(@var{phi0},@var{phi1})} function returns 2x2 phase rotation matrix
## performing rotation by @var{phi0} rad on state |0> and  @var{phi1} rad on state |1>.
## @example 
## @group
## phase(0,pi/4)
##  @result{} 
## 1.00000 + 0.00000i  0.00000 + 0.00000i
## 0.00000 + 0.00000i  0.70711 + 0.70711i
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {id, sx, h, rotx, roty, rotz}
##

function ret = phase(phi0,phi1)
	if (nargin!=2)
		usage('phase (phi0,phi1)');
	endif
	ret =  [e^(i*phi0), 0; 0, e^(i*phi1)];
endfunction
