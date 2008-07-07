%% -*- texinfo -*-
%% @deftypefn {Function file} {} ProductGate(@var{size},@var{gate},@var{targetv})
%% Function @code{ProductGate} generates operator of size equal 2^@var{size}.
%% Parameter @var{gate} is 2x2 basic operator (ex. Not). Paramter
%% @var{targetv} is list of indices of target qubits.
%%
%% @example 
%% @group
%% ProductGate(3,Not,[1,2])
%%  @result{}
%% 0  0  0  0  0  0  1  0
%% 0  0  0  0  0  0  0  1
%% 0  0  0  0  1  0  0  0
%% 0  0  0  0  0  1  0  0
%% 0  0  1  0  0  0  0  0
%% 0  0  0  1  0  0  0  0
%% 1  0  0  0  0  0  0  0
%% 0  1  0  0  0  0  0  0
%%
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {ControledGate, Id, Not, H, Pase}
%%

function ret = ProductGate(size,gate,targetv)
if(nargin~=3)
    usage('ProductGate(size,gate,targetv)');
end
if(~is_scalar(size))
    error('1st parameter should be scalar!');
end

if(is_square(gate)~=2)
    error('2nd parameter should be matrix 2x2!');
end

if(size < max(targetv))
    error('Operator acts on %d qubits, max target index is %d!', size, max(targetv));
end
if (min(targetv)<1)
    error('Qubit index less than 0!');
end

idx = 1;
lv = sort(targetv);
if (lv(1) == 1)
    tmp = gate;
    idx=idx+1;
else
    tmp = Id(1);
end

for i = 2:size
    if((idx <= length(lv)) && (lv(idx) == i))
        tmp = kron(tmp,gate);
        idx=idx+1;
    else
        tmp = kron(tmp,Id(1));
    end
end

ret = tmp;

end
