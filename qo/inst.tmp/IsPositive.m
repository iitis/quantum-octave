%% -*- texinfo -*-
%% @deftypefn {Function file} {} ispositive(@var{matrix})
%% Function @code{ispositive} returns @code{1} if matrix @var{matrix} has 
%% only nonegative density matrix and @code{0} if it is has negative one. 
%% 
%% @example 
%% @group
%% ispositive(State(Ket([0,0,0])))
%%  @result{} 
%%	1
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {State, MixStates, PTranspose, IsPPT}
%%

function ret = ispositive(matrix)
	ret = false;
	if ( nargin ~= 1 )
		usage ("ispositive (matrix)");
	else
		# test if matrix is positive
		if ( min(eig(matrix)) < 0 )
			ret = false;
		else
			ret = true;
			endif
	endif
endfunction