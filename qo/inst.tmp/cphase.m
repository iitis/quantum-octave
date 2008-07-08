%% -*- texinfo -*-
%% @deftypefn {Function file} {} cphase(@var{size},@var{phase},@var{contrv},@var{targetv})
%% Function @code{cphase} returns controled phase rotation by @var{phase} on qubits @var{targetv} 
%% controled by @var{contrv}. Size of the result gate is given by @var{size}.
%% @end deftypefn
%%
%% @seealso {phase, controlledgate, cnot}
%%

function ret = cphase(s,alpha,contrv,targetv)
	if ( nargin ~= 4 ) 
		usage ('cphase (size, alpha, control, targets)');
	endif
	p = phase(0,alpha);

	ret = controlledgate(s, p, contrv, targetv);
endfunction
