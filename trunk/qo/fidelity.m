## -*- texinfo -*-
## @deftypefn {Function file} {} fidelity(rho, sigma)
## Function @code{fidelity} returns fidelity (distance between)
## of state @var{rho} vs. @var{sigma}.
##
## @end deftypefn
##
## @seealso {entropy, tracenorm}
##

function ret = fidelity(rho,sigma)
	if (nargin~=2)
		usage('fidelity (rho, sigma)');
	else 
		sqrtrho = sqrtm(rho);
		temp = sqrtrho*sigma*sqrtrho;
		temp = sqrtm(temp);
		ret = trace(temp);
	endif
endfunction
