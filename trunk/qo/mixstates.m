## -*- texinfo -*-
## @deftypefn {Function File} {} mixstates (@var{state}, @dots{})
## This function allow to represent a mixture of mixed states.
## The argument is a list of density matrices (for example returned
## by function State). Every density matrix can be preceded by a
## number. If no number is specifed the default value 1 is used. 
## The result is normalised so that it is a vaild density matrix.
## For example:
## @example
## @group
## mixstates(state(ket([0,1])), 0.5, state(ket([1,0])))
##  @result{}
## 0.00000  0.00000  0.00000  0.00000
## 0.00000  0.66667  0.00000  0.00000
## 0.00000  0.00000  0.33333  0.00000
## 0.00000  0.00000  0.00000  0.00000
## @end group
## @end example
## @end deftypefn
##

function ret = mixstates(varargin)
	argc =  nargin;
	
	if (argc == 0)
		usage ('mixstates ([num,] state [[,num], state] )');
	endif
	
	was_scalar = false;
	mixs = 1;
	
	# build structure for representing mixture
	for argn = 1:argc
		if ( isscalar(varargin{argn}) )
			if ( was_scalar )
				error ('mixstates: Wrong form of mixture (two numbers without matrix)!');
			elseif ( !was_scalar ) 
				mixture(mixs).c = varargin{argn};
				was_scalar = true;
			endif
		elseif ( issquare(varargin{argn}) && !isscalar(varargin{argn}) )
			mixture(mixs).m = varargin{argn};
			if ( was_scalar )
				mixture(mixs).c = varargin{argn-1};
			elseif ( !was_scalar )
				mixture(mixs).c = 1;
			endif
			was_scalar = false;
			mixs++;
			endif
	endfor
	
	# sum components
	ret =  zeros( size(mixture(1).m) );
	for n = 1:mixs - 1
		ret += mixture(n).c*mixture(n).m ;
	endif
	
	# normalize result
	ret = ret/trace(ret);
endif