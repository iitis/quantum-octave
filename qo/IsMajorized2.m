%% -*- texinfo -*-
%% @deftypefn {Function file} {} IsMajorized2(v,w,eps)
%% Function @code{IsMajorized} checks if vector 
%% @var{v} is majorized by %var{w} with accuracy @var{eps} 
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
%% @seealso {IsMajorized, PTrace}
%%

function ret = IsMajorized2(v1, v2, eps)
	if (nargin < 2 || nargin > 3)
		error ('Wrong number of arguments!');
	elseif ( size(v1,2) ~= size(v2,2) )
		error ('Arguments of different size!');
    else
        if (nargin == 2) 
    		s1 = sort(v1);
        	s2 = sort(v2);
            vs = size(v1,2);
    		for i=vs:-1:1
        		if (sum(s1(i:vs)) >= sum(s2(i:vs)) )
            		ret = false;
                	return
                end
            end
            ret = true;
        elseif (nargin == 3)
            s1 = sort(v1);
        	s2 = sort(v2);
            vs = size(v1,2);
    		for i=vs:-1:1
        		if (sum(s1(i:vs)) >= sum(s2(i:vs)) + eps )
            		ret = false;
                	return
                end
            end
            ret = true;
        end
	end
end
