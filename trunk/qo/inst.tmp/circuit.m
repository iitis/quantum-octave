## -*- texinfo -*-
## @deftypefn {Function File} {} circuit (@var{gate}, @dots{})
## 

function ret = circuit(varargin)
	global quantum_octave_sparse;
	if (nargin==0)
		usage('circuit(gate[, gate [, ...]])');
	endif
	
	if (exist("quantum_octave_sparse") && quantum_octave_sparse==true)
		ret = speye(size(varargin{1}));
	else
		ret = eye(size(varargin{1}));
	endif

	for i=1:nargin
			ret = ret * varargin{nargin+1 - i};
	endfor
endfunction
