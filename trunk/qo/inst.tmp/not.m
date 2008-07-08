## -*- texinfo -*-
## @deftypefn {Function File} {} not () 
## The @code{not()} function returns matrix 
## which represents not operation.
##
## @example
## @group
## not()
## @result{}	
##	0  1
##	1  0
## @end group
## @end example
## @end deftypefn
## @seealso{id, h, phase, rotx, roty, rotz}
##

function ret = not()
	ret = [0,1;1,0];
end
