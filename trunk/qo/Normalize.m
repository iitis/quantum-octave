## -*- texinfo -*-
## @deftypefn {Function File} Normalize (@var{Ket}, ...)
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
## Last modification: 25 May 2004

function ret = Normalize(varargin)
if (nargin < 1 )
	usage ("Normalize (Ket[, ...])");
endif
ret = [0];
NARGIN = nargin;

vek = varargin{1};
temp = zeros(length(vek),NARGIN);

ketlength = length(vek);
while (NARGIN)
	vek = varargin{NARGIN--};
	if ( isvector (vek) && length(vek)==ketlength)
		temp(:,NARGIN+1)=vek;
	else
		error("Vectors are of different sizes!");
		return;
	endif
endwhile

ret = sum(temp,2); # sum verticaly
norm = sqrt(ret'*ret); # normalize
ret = ret./norm;
endfunction
