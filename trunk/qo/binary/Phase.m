## -*- texinfo -*-
## @deftypefn {Function File} {} Phase (@var{phi})
## The @code{Not(@var{phi})} function returns 2x2 phase rotation by @var{phi} rad matrix
## @example 
## @group
## Phase(pi/4)
##  @result{} 
## 0.70711 + 0.70711i  0.00000 + 0.00000i
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

function ret = Phase(phi)
	ret = Id(1).*e^(i*phi);
endfunction
