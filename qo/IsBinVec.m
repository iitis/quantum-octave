%% -*- texinfo -*-
%% @deftypefn {Function file} {} IsBinVec(@var{vec})
%% This is helper function which returns true if @var{vec}
%% is of the form @code{[b1,b2,...,bn]} where @code{bi = 0}
%% or @code{bi = 1} for every @code{i}.
%% 
%% @example 
%% @group
%% IsBinVec([0,1,2])
%%  @result{} 
%%	0
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {Dec2BinVec, dec2bin}
%%

function ret = IsBinVec(vec)
ret = false;

if ( nargin ~= 1 )
	usage ('IsBinVec (vector)');
end

if ( isvector(vec))
	vs = size(vec,2);
	for i = 1:vs
		if ( (vec(i) ~= 1) && (vec(i) ~= 0) )
			ret = false;
			return;
        end
    end
	ret = true;
end

end
