## -*- texinfo -*-
## @deftypefn {Function File} Normalize (@var{Ket})
## The @code{Normalize} function generates normalized Ket vector from any
## number of @var{Ket}s. 
## @example
## Normalize (Ket([0,1,1]),2*Ket([1,0,0]))
## @result{}
##	0.00000
##	0.00000
##	0.00000
##	0.44721
##	0.89443
##	0.00000
##	0.00000
##	0.00000
## @end example
## @end deftypefn
## @seealso{State, Evolve}
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003
## Last modification: 25 March 2004

function ret = Normalize(varargin)
ret = [0];
vek = va_arg();
temp = zeros(length(vek),nargin);

va_start();
ketlength = length(vek);
while (nargin--)
	vek = va_arg();
	if ( isvector (vek) && length(vek)==ketlength)
		temp(:,nargin+1)=vek;
	else
		error("Vectors are of different sizes!");
		return;
	endif
endwhile

ret = sum(temp,2); # sum verticaly
norm = sqrt(ret'*ret);
ret = ret./norm;
endfunction
