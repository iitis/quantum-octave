# Returns random state of s qubits chosen randomly according to Haar measure.
function ret=randomstate(s)
	v=randn(2^(2*s),1)+i*randn(2^(2*s),1);
	v=v./sqrt(sum(abs(v).^2));
	ret=ptrace(v*v',[s+1:2*s]);
endfunction
