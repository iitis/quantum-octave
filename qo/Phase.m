## -*- texinfo -*-
## @deftypefn {Function File} Phase (@argument(phi))
## The @code{Not(@argument{phi})} function returns
## 2x2 phase rotation by @argument{phi} rad matrix
## @end deftypefn

## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Phase(phi)
	ret = Id(1).*e^(i*phi);
endfunction
