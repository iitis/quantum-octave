## -*- texinfo -*-
## @deftypefn{Function file} {} maximallymixed([@var{size}])
## Function @code{Id(@var{size})} returns 2^@var{size} x 2^@var{size} 
## unitary matrix - that is matrix accting on @var{size} qubits.
## Argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## maximallymixed(2)
##  @result{}
##	
## @end group
## @end example
## @end deftypefn
## @seealso {}
 

function ret = maximallymixed(n)
	if( nargin == 1)
		ret = (1/2^n)*id(n);
	elseif( nargin == 0)
		ret = (1/2)*id(1);
	else
		usage('maximallymixed([qubits])')
	endif
endfunction
