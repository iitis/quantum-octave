## -*- texinfo -*-
## @deftypefn {Function File} {} circuit (@var{gate}, @dots{})
## 

function ret = circuit(varargin)
	if (nargin==0)
		usage('circuit(gate[, gate [, ...]])');
	endif
	
	ret = eye(size(varargin{1}));
	for i=1:nargin
			ret = ret * varargin{nargin+1 - i};
	endfor
endfunction
