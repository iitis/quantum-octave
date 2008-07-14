## -*- texinfo -*-
## @deftypefn{Function file} {} isone(@var{elements})
## Function @code{ischannel} generalized quantum evolution on the state @var{state}.
## @example
## @group
## applychannel(state(ket([0,1])), { sqrt(0.5)*id(),(sqrt(1-0.5))*sz })
##  @result{}
##
## @end group
## @end example
## @end deftypefn
## @seealso {ischannel, isunitary}

function ret = isone(matrix,precision)
	if (not(nargin==1 || nargin==2))
		usage("isone(matrix[,precision])")
	endif
	if (nargin==1)
		precision=10*eps;
	endif
	
	if(size(matrix,1)~=size(matrix,2))
		ret = false;
		return;
	elseif(norm(vec(matrix - eye(size(matrix))),Inf) < precision)
		ret = true;
		return;
	else
		ret = false;
		return;
	endif
endfunction
