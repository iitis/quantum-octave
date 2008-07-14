## -*- texinfo -*-
## @deftypefn {Function file} {} isunitary(@var{mtx})
## Function @code{isunitary} returns @code{1} if matrix 
## @var{mtx} is unitary matrix and @code{0} if it is not. 
## 
## @example 
## @group
## isunitary(sx)
##  @result{} 
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ischannel, ispositive}
##
function ret = isunitary(matrix)
	if(size(matrix,1)~=size(matrix,2))
		ret = 0;
		return;
	elseif(isone(matrix*matrix'))
		ret = 1;
		return;
	else
		ret = 0;
		return;
	endif
endfunction
