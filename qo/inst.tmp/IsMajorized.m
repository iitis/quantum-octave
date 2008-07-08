## -*- texinfo -*-
## @deftypefn {Function file} {} ismajorizedvector(v,w)
## Function @code{ismajorizedvector} checks if vector 
## @var{v} is majorized by %var{w}
## 
## @example 
## @group
## ismajorizedvector(v,w)
##  @result{} 
##	0.70711   0.70711
##	0.70711  -0.70711
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ismajorizedvector2, PTrace}
##

function ret = ismajorizedvector(v1, v2, precision)
	if (nargin !=2 || nargin !=3)
		usage('ismajorizedvector(v1, v2[, epsilon]));
	elseif ( size(v1,2) ~= size(v2,2) )
		error ('Arguments of different size in ismajorizedvector()!');
	else
	if (nargin=2)
		precision=10e-20
	endif
		s1 = sort(v1);
		s2 = sort(v2);
		vs = size(v1,2);
		for i=vs:-1:1
			if (sum(s1(i:vs)) >= sum(s2(i:vs)) + precision)
				ret = false;
				return
			endif
		endif
		ret = true;
	endif
endfunction
