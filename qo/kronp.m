## -*- texinfo -*-
## @deftypefn {Function File} {} kronp (@var{matrix}, @dots{})
##
## @example
## @end example
##
## @end deftypefn
##
## @seealso{state, kron}
##

function ret = kronp(varargin)
n = length(varargin);
ret = 1;
	while (n)
			ret = __kron(varargin{n},ret);
			n = n - 1;
	endwhile
endfunction
