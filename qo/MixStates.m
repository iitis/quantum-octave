## -*- texinfo -*-
## @deftypefn {Function File} {} MixStates (@var{state}, @dots{})
##This function allow to represent a mixture of mixed states.
##The argument is a list of density matrices (for example returned
##by function State). Every density matrix can be preceded by a
##(complex) number. If no number is specifed the default
##value 1 is used. If a numbe is specified then it is
##normalied so that the result would be vaild density matrix.
##For example:
##@example
##@group
##MixState(State(Ket([0,1])), 0.5, State(Ket([1,0])))
##	@result{}
##	0.00000  0.00000  0.00000  0.00000
##	0.00000  0.66667  0.00000  0.00000
##  	0.00000  0.00000  0.33333  0.00000
##  	0.00000  0.00000  0.00000  0.00000
##@end group
##@end example
##@end deftypefn

## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = MixStates(varargin)
summtr = 0;
coef = 1;
sum = 0;

matrix_size = [0,0];

while(nargin--)
temp = va_arg();
	if(length(temp)>1)
		if (coef==1)
     sum++;
		endif

		if(matrix_size==[0,0])
			matrix_size = size(temp);
		elseif(matrix_size!=size(temp))
			error("Matrices have to be the same size");
		elseif(size(temp)(1)!=size(temp)(2))
			error("Matrices have to be square");
		elseif(floor(log2(size(temp)))!=ceil(log2(size(temp))))
			error("Matrices have to be size 2^n x 2^n");
		endif

		summtr+=coef.*temp;
		coef=1;
	else
		coef=temp;
		sum+=coef;
	endif
endwhile
sum;
ret = summtr./sum;

endfunction
