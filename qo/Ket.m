## -*- texinfo -*-
## @deftypefn {Function File} {} Ket (@var{binary_vector}, @dots{})
## The @code{Ket} function generates vertical complex vector from any
## number of @var{binary_vector}s.
##
## @example
## @group
## Ket([1,0,1])
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
## @seealso{ State, Not, Id, H}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003
## Last modyfication: 18 March 2004

function ret = Ket (binvec)
if ( size(binvec)(1) != 1 )
	error("Error in input vector!");
endif
num = 0;
for i = 1: size(binvec)(2)
	temp = binvec(i);
	if (temp == 0 || temp ==1)
		num += (2^(i-1))*binvec(i);
	else
		error("Number %d found in input vector!",temp);
	endif
endfor
ret = KetN(num,size(binvec)(2));
endfunction
