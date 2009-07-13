## -*- texinfo -*-
## @deftypefn {Function File} {} set_quantum_octave_sparse (bool)
## The @code{set_quantum_octave_sparse} sets @var{quantum_octave_sparse} 
## global variable to @var{bool} value
##
## @example
## @end example
##
## @end deftypefn
##
## @seealso{kron,spkron}
##

function set_quantum_octave_sparse(bool)
	global quantum_octave_sparse;
	if nargin!=1
		usage("set_quantum_octave_sparse(bool)");
		return;
	else
		quantum_octave_sparse=bool;
	endif
endfunction