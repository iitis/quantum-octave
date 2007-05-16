%% -*- texinfo -*-
%% @deftypefn {Function file} {} IsUnitary(@var{mtx})
%% Function @code{IsUnitary} returns @code{1} if matrix 
%% @var{mtx} is unitary matrix and @code{0} if it is not. 
%% 
%% @example 
%% @group
%% IsUnitary(Sx())
%%  @result{} 
%%	1
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {State, MixStates}
%%
function ret = IsUnitary(matrix)
	if(size(matrix,1)~=size(matrix,2))
		ret = 0;
		return;
	elseif(norm((matrix*matrix')-eye(size(matrix)),'fro')<1e-15)
		ret = 1;
		return;
	else
		ret = 0;
		return;
    end
end
