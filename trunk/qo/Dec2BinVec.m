## -*- texinfo -*-
## @deftypefn {Function file} {} Dec2BinVec(@var{number},@var{length})
## Function @code{Dec2BinVec} returns binary vector representing
## @var{length}-bit representation of number @var{number}. This
## number must be nonegative ang less then 2^@var{len}.
## 
## @example 
## @group
## Dec2BinVec(4,3)
##  @result{} 
##	1 0 0
## Dec2BinVec(4,4)
##  @result{} 
##	0 1 0 0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {dec2bin, BinVec2Dec, BinVec}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 8 March 2004
## Last modyfication: 22 March 2004

function ret = Dec2BinVec(number, len)
if (nargin != 2)
	usage("Two numbers required!");
endif

# number must be nonegative
if( number > 2^len )
	error("Number %d is to big to fit length %d!", number, len);
endif

# get number as a string
temp = dec2bin([number,2^len-1])(1,:);

# build binary vector based on number
ret = zeros(1,len);
# fill it!
for i=1:len
	ret(i) = str2num(temp(i));
endfor
endfunction
