## -*- texinfo -*-
## @deftypefn {Function file} {} binvec2dec(@var{binvec})
## Function @code{binvec2dec} returns number build form binary column 
## vector @code{binvec = [b1,..,bn]} according to the formula
##
##	ret = sum(2.^[0:bs-1].*binvec');
##
## wher @code{bs} is dimension of @var{binvec}.
##
## NOTE: @code{i}-th element of @var{binvec} represents @code{i-1}-th
## bit of number. For example
## 
## @example 
## @group
## binvec2dec([1,0,0,0])
##  @result{} 
##	8
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {dec2bin, binvec2dec, binvec}
##

function ret = binvec2dec(binvec)
	if (nargin != 1)
		usage ('binvec2dec(binary_vector)');
	endif
	
	if ( isbinvec(binvec) != 1 )
		error ('binvec2dec: Binary vector expected!');
	endif
	
	bs = size(binvec,2);
	
	# reverse binvec
	for i = 1:bs
		temp(i) = binvec(bs+1 - i);
	endfor
	
	# build number based on binary vector
	ret = sum(2.^[0:bs-1].*temp);

endfunction