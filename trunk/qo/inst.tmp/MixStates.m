%% -*- texinfo -*-
%% @deftypefn {Function File} {} MixStates (@var{state}, @dots{})
%% This function allow to represent a mixture of mixed states.
%% The argument is a list of density matrices (for example returned
%% by function State). Every density matrix can be preceded by a
%% number. If no number is specifed the default value 1 is used. 
%% The result is normalised so that it would be a vaild density matrix.
%% For example:
%% @example
%% @group
%% MixStates(State(Ket([0,1])), 0.5, State(Ket([1,0])))
%%  @result{}
%% 0.00000  0.00000  0.00000  0.00000
%% 0.00000  0.66667  0.00000  0.00000
%% 0.00000  0.00000  0.33333  0.00000
%% 0.00000  0.00000  0.00000  0.00000
%% @end group
%% @end example
%% @end deftypefn
%%

function ret = MixStates(varargin)
argc =  nargin;

if (argc == 0)
	usage ('MixStates ([num,] state [[,num], state] )');
end

was_scalar = false;
mixs = 1;

% buil structure for representing mixture
for argn = 1:argc
	if ( isscalar(varargin{argn}) )
		if ( was_scalar )
			error ('Wrong form of mixture (two numbers without matrix)!');
		elseif ( ~was_scalar ) 
			mixture(mixs).c = varargin{argn};
			was_scalar = true;
        end
	elseif ( issquare(varargin{argn}) && ~isscalar(varargin{argn}) )
		mixture(mixs).m = varargin{argn};
		if ( was_scalar )
			mixture(mixs).c = varargin{argn-1};
		elseif ( ~was_scalar )
			mixture(mixs).c = 1;
        end
		was_scalar = false;
		mixs++;
    end
end

% sum components
ret =  zeros( size(mixture(1).m) );
for n = 1:mixs - 1
	ret += mixture(n).c*mixture(n).m ;
end

% normalize result
ret = ret/trace(ret);

end