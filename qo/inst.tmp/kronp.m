## -*- texinfo -*-
## @deftypefn {Function File} {} kronp (@var{matrix}, @dots{})
## The @code{Ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
##
## @example
## @end example
##
## @end deftypefn
##
## @seealso{state, kron}
##

function ret = kronp(varargin)
n = n;
ret = 1;
	while (n)
			ret = kronp(varargin{n},ret);
			n = n - 1;
	endwhile
endfunction
