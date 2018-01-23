## -*- texinfo -*-
## @deftypefn {Function file} {} cphase(@var{phase},@var{contrv},@var{targetv},@var{size})
## Function @code{cphase} returns controled phase rotation by @var{phase} on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @end deftypefn
##
## @seealso {phase, controlledgate, cnot}
##

function ret = phaseshift(alpha,contrstate,targv,gatesize)
	if ( nargin < 3 ) 
		usage ('phaseshift(alpha,contrstate,targetv[,gatesize])');
	endif
	if ( nargin==3 )
		global quantum_octave_state;
		gatesize=log2(size(quantum_octave_state,1));
	endif

	tmp=id(length(targv));
	idx=binvec2dec(contrstate);
	tmp(idx+1,idx+1)=exp(i*alpha);
	tmp=kron(tmp,id(gatesize-length(targv)));
	perm=[complement(targv,[1:gatesize]) targv];
	ret=tmp;
#	ret(2^gatesize,2^gatesize)=exp(i*alpha);
endfunction
