## -*- texinfo -*-
## @deftypefn {Function file} {} dec2binvec(@var{number},@var{length})
## Function @code{dec2binvec} returns binary vector representing
## @var{length}-bit representation of number @var{number}. This
## number must be nonegative ang less then 2^@var{len}.
## 
## @example 
## @group
## dec2binvec(4,3)
##  @result{} 
##	1 0 0
## dec2binvec(4,4)
##  @result{} 
##	0 1 0 0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {dec2bin, BinVec2Dec, BinVec}
##

function ret = dec2binvec(number, len)
	if (nargin != 2)
		usage('dec2binvec(number, len)');
	endif
	# number must be nonegative
	if( number > 2^len )
		error('Number %d is to big to fit length %d!', number, len);
	endif
	
	# get number as a string
	temp = dec2bin([number,2^len-1]);
	temp = temp(1,:);
	
	# build binary vector based on number
	ret = zeros(1,len);
	# fill it!
	for i=1:len
		ret(i) = str2num(temp(i));
	endfor
endfunction