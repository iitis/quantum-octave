## -*- texinfo -*-
## @deftypefn{Function file} {} id([@var{size}])
## Function @code{id(@var{size})} returns 2^@var{size} x 2^@var{size} 
## unitary matrix - that is matrix accting on @var{size} qubits.
## Argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## id(2)
##  @result{}
##	1  0  0  0 
##	0  1  0  0
##	0  0  1  0
##	0  0  0  1
## @end group
## @end example
## @end deftypefn
## @seealso {Not, H, Pase}
## 

function ret = id(arg)
	if(nargin>1)
		help id;
		return;
	endif
	if(nargin==1)
		di = arg;
	elseif(nargin==0)
		di = 1;
  endif
	
	global quantum_octave_sparse;
	if (exist("quantum_octave_sparse") && quantum_octave_sparse==true)
			ret = speye(2^di);
		else
			ret = eye(2^di);
	endif
endfunction
