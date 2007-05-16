%% -*- texinfo -*-
%% @deftypefn {Function File} {} ErrorX (@var{epsilon})
%% The @code{ErrorX} function returns matrix 
%% which represents bitflip error with given probability.
%%
%% @example
%% @group
%% ErrorX(0.1)
%% @result{}	
%%	0.90000  0.10000
%%	0.10000  0.90000
%% @end group
%% @end example
%% @end deftypefn
%% @seealso{Id, H, Phase, RotX, RotY, RotZ}
%%

function ret = ErrorX(epsilon)
if (nargin ~= 1)
	usage(ErrorX(epsilon));
end
if(epsilon <0 || epsilon>1)
	error('Parameter shoold be in [0,1]!');
end
	ret = (epsilon) * Not + (1-epsilon) * Id;
end
