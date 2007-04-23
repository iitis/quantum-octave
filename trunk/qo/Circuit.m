%% -*- texinfo -*-
%% @deftypefn {Function File} {} Circuit (@var{gate}, @dots{})
%% 

function ret = Circuit(varargin)

if (nargin==0)
	usage('Circuit(gate[, gate])');
end

ret = eye(size(varargin{1}));
	
	for i=1:nargin
		ret = ret * varargin{nargin+1 - i};
    end
end
