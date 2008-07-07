%% -*- texinfo -*-
%% @deftypefn {Function file} {} IsPositive(@var{mtx})
%% Function @code{IsPositive} returns @code{1} if matrix @var{mtx} has 
%% only nonegative density matrix and @code{0} if it is has negative one. 
%% 
%% @example 
%% @group
%% IsPositive(State(Ket([0,0,0])))
%%  @result{} 
%%	1
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {State, MixStates, PTranspose, IsPPT}
%%

function ret = IsPositive(mtx)
ret = false;

if ( nargin ~= 1 )
	usage ('IsPositive (matrix)');
else
	% test if matrix is positive
	if ( min(eig(mtx)) < 0 )
		ret = false;
	else
		ret = true;
    end
end

end
