## -*- texinfo -*-
## @deftypefn {Function File} {} Not () 
## The @code{Not()} function returns matrix 
## which represents Not operation.
##
## @example
## @group
## Not()
## @result{}	
##	0  1
##	1  0
## @end group
## @end example
## @end deftypefn
## @seealso{Id, H, Phase, RotX, RotY, RotZ}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = GetPureState(state)
	[v,l]=eig(state);
	
	if(size(v)!=1)
		ret = NaN;	
	endif
	ret = v(:,size(v)(2));


endfunction
