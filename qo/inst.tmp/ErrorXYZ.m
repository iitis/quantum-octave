%% -*- texinfo -*-
%% @deftypefn {Function File} {} ErrorXYZ (@var{epsilon})
%% The @code{ErrorXYZ} function returns matrix 
%% which represents bitflip error with given probability.
%%
%% @example
%% @group
%% ErrorXYZ(0.1,0.2,0.3)
%% @result{}	
%%	0.70000 + 0.00000i  0.10000 - 0.20000i
%%	0.10000 + 0.20000i  0.10000 + 0.00000i
%% @end group
%% @end example
%% @end deftypefn
%% @seealso{Id, H, Phase, RotX, RotY, RotZ}
%%

function ret = ErrorXYZ(epsilonX,epsilonY,epsilonZ)
if (nargin ~= 3)
	usage('ErrorXYZ(epsilonX,epsilonY,epsilonZ)');
end
epssum = epsilonX + epsilonY + epsilonZ; 

if(epsilonX<0 || epsilonY<0 || epsilonZ<0)
	error('Parameters must be greater than 0!');
end

if(epssum <0 || epssum>1)
	error('Sum of parameters should be in [0,1]!');
end
	ret = epsilonX * Sx + epsilonY * Sy + epsilonZ * Sz + (1-epssum) * Id;
endf
