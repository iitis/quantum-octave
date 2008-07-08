## -*- texinfo -*-
## @deftypefn {Function file} {} concurrence(@var{rho})
## Function @code{concurrence} returns concurrence of the 
## two qubit state @var{rho}. Functions can calculate concurrence 
## for density matrix or state vector.
##
## @end deftypefn
##
## @seealso {negativity, vnentropy, tracenorm}
##

function ret = concurrence (state)
	if ( nargin ~= 1)
		usage('concurrence (state)');
	endif

	ss = size(state);
	gt = kron(sy,sy); # fliping operation

	if ( ss == [4,1] )
		fs = gt*conj(state); # flip the state vector
		ret = abs (state'*fs);
	elseif ( ss == [4,4] )
		fs = gt*(conj(state)*gt);  # flip the state matrix
		ev = sqrt(sort(eig (state*fs))); # compute square roots of eigenvalues of state*fs
		ret = max(0,ev(4) - ev(3) - ev(2) - ev(1));
	else
		error ('I do not know how to compute conncurrence for this state');
	endif
endfunction