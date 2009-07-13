## -*- texinfo -*-
## @deftypefn {Function file} {} fidelitypuremixed(psi,rho)
## Function @code{fidelity} returns fidelity (distance between)
## of state vector @var{rho} vs. @var{rho}.
##
## @end deftypefn
##
## @seealso {entropy, tracenorm,fidelity}
##

function ret = fidelitypuremixed(psi,rho)
	if (nargin~=2)
		usage("fidelitypuremixed(psi,rho)");
	else 
		ret = sqrt(psi'*rho*psi);
	endif
endfunction