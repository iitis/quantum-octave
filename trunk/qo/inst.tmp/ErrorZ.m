%% -*- texinfo -*-
%% @deftypefn {Function File} {} ErrorZ (@var{epsilon})
%% The @code{ErrorZ} function returns matrix 
%% which represents phaseflip error with given probability.
%%
%% @example
%% @group
%% ErrorZ(0.1)
%% @result{}	
%%  	1.00000  0.00000
%% 	0.00000  0.80000
%% @end group
%% @end example
%% @end deftypefn
%% @seealso{Id, H, Phase, RotX, RotY, RotZ}
%%

function ret = ErrorZ(epsilon)
if (nargin ~= 1)
	usage(ErrorZ(epsilon));
end
if(epsilon <0 || epsilon>1)
	error('Parameter shoold be in [0,1]!');
end
	ret = (epsilon) * Sz + (1-epsilon) * Id;
end