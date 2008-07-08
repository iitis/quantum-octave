## -*- texinfo -*-
## @deftypefn {Function File} {} ket (@var{binary_vector}, @dots{})
## The @code{ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
##
## @example
## @group
## ket([1,0,1])
## @result{}
##	0
##	0
##	0
##	0
##	0
##	1
##	0
##	0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso{state, sx, id, h}
##

function ret = ket (binvec)
	if (nargin ~= 1 )
		usage ('ket (binvec)');
	endif

	if ( size(binvec,1) ~= 1 )
		error('Error in input vector!');
	endif
	
	num = 0;
	s = size(binvec,2);
	
	for i = 1:s
		temp = binvec(s+1 - i);
		if (temp == 0 || temp ==1)
			num = num + (2^(i-1))*temp;
		else
			error('Number %d found in input vector!',temp);
		endif
	endfor
	ret = ketn(num,size(binvec,2));
endfunction
