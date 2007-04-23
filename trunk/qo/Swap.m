%% -*- texinfo -*-
%% @deftypefn {Function file} {} Swap(size, qubits)
%% Function @code{Swap} returns Swap operation on 
%% @var{size} qubits exchanging qubits specified in 
%% @var{qubits}. Note that exacly two qubits must be
%% specified.
%%
%% @example 
%% @group
%% Swap(2,[1,2])
%%  @result{} 
%% 1   0   0   0
%% 0   0   1   0
%% 0   1   0   0
%% 0   0   0   1
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {CNot, ControlledGate}
%%
function ret = Swap(s, qubits)
if (nargin ~=2)
	usage('Swap(size, qubits)');
end
if (size(qubits,2)~=2)
	error('Only exactly 2 qubits can be swaped!');
end

if ( ( qubits(1) > s || qubits(2) > s ))
	error('Qubit index out of bound!');
end

if (qubits(1)==qubits(2))
	ret = Id(s);
else
	g1 = CNot(s, qubits(1), qubits(2));
	g2 = CNot(s, qubits(2), qubits(1));
	g3 = CNot(s, qubits(1), qubits(2));

	ret = Circuit(g1,g2,g3);
end

end
