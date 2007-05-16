%% -*- texinfo -*-
%% @deftypefn {Function file} {} Concurrence(@var{rho})
%% Function @code{Concurrence} returns concurrence of the 
%% two qubit state @var{rho}. Functions can calculate concurrence 
%% for density matrix or state vector.
%%
%% @end deftypefn
%%
%% @seealso {Negativity, Entropy, TrNorm}
%%

function ret = Concurrence (state)
if ( nargin ~= 1)
	usage('Concurrence (state)');
end

ss = size(state);
gt = kron(Sy,Sy); % fliping operation

if ( ss == [4,1] )
	fs = gt*conj(state); % flip the state vector
	ret = abs (state'*fs);
elseif ( ss == [4,4] )
	fs = gt*(conj(state)*gt);  % flip the state matrix
	ev = sqrt(sort(eig (state*fs))); % compute square roots of eigenvalues of state*fs
	ret = max(0,ev(4) - ev(3) - ev(2) - ev(1));
else
	error ('I do not know how to compute conncurrence for this state');
end

end
