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

function ret = Normalize(varargin)
ret = [0];
vek = va_arg();
tempmtr = zeros(length(vek),nargin);

va_start();
ketlngth = length(vek);
while (nargin--)
	vek = va_arg();
	if ( isvector (vek) && length(vek)==ketlngth)
		tempmtr(:,nargin+1)=vek;
	else
		error("Normalize: vectors are of different sizes");
		clear ret;
		return;
	endif
endwhile

ret = sum(tempmtr,2);
norm = sqrt(ret'*ret);
ret = ret./norm;
endfunction
