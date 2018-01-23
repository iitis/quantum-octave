## -*- texinfo -*-
## @deftypefn {Function File} {} __kron (a,b)
## The @code{__kron} function wraps @code{kron} and @code{spkron} functions
##
## @example
## @end example
##
## @end deftypefn
##
## @seealso{kron,spkron}
##

function ret = __kron(a,b)
	global quantum_octave_sparse;
	if nargin!=2
		usage("__kron(a,b)");
	else
		if (exist("quantum_octave_sparse") && quantum_octave_sparse==true)
			ret = spkron(a,b);
		else
			ret = kron(a,b);
		endif
	endif
endfunction