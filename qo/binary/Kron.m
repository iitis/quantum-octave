## -*- texinfo -*-
## @deftypefn {Function File} {} Kron (@var{matrix}, @dots{})
## The @code{Ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
##
## @example
## @end example
##
## @end deftypefn
##
## @seealso{ State, Not, Id, H}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Kron(varargin)

NARGIN = nargin;

ret = 1;
while (NARGIN)
	ret = kron(varargin{NARGIN--},ret);
endwhile

endfunction
