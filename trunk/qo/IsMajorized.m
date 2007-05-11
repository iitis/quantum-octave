%% -*- texinfo -*-
%% @deftypefn {Function file} {} IsMajorized(v,w)
%% Function @code{IsMajorized} checks if vector 
%% @var{v} is majorized by %var{w}
%% 
%% @example 
%% @group
%% H()
%%  @result{} 
%%	0.70711   0.70711
%%	0.70711  -0.70711
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {IsMajorized2, PTrace}
%%

function ret = IsMajorized(v1, v2)
	if (nargin ~= 2)
		error ('Wrong number of arguments!');
	elseif ( size(v1,2) ~= size(v2,2) )
		error ('Arguments of different size!');
	else
		s1 = sort(v1);
		s2 = sort(v2);
		vs = size(v1,2);
		for i=vs:-1:1
			if (sum(s1(i:vs)) >= sum(s2(i:vs)) + 10e-20 )
				ret = false;
				return
			end
		end
		ret = true;
	end
end
