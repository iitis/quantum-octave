## -*- texinfo -*-
## @deftypefn {Function File} {} Phase (@var{phi0},@var{phi1})
## The @code{Phae(@var{phi0},@var{phi1})} function returns 2x2 phase rotation matrix
## performing rotation by @var{phi0} rad on state |0> and  @var{phi1} rad on state |1>.
## @example 
## @group
## Phase(0,pi/4)
##  @result{} 
## 1.00000 + 0.00000i  0.00000 + 0.00000i
## 0.00000 + 0.00000i  0.70711 + 0.70711i
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Id, Not, H, RotX, RotY, RotZ}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003
## Modified: 3 June 2004

function ret = Phase(phi0,phi1)
if (nargin!=2)
	usage("Phase (phi0,phi1)");
endif
	ret =  [e^(i*phi0), 0; 0, e^(i*phi1)];
endfunction
