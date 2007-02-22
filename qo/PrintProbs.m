## -*- texinfo -*-
## @deftypefn {Function file} {} PrintProbs(@var{ket})
## Function @code{PlotProbs} prints amplitude of @var{ket} vector in standard base.
## Try this:
## @example 
##  @group
## PrintProbs(Ket([1,1,0]))
## PrintProbs(Ket([1,0])+Ket([0,1]))
## PrintProbs(Ket([1,0])+i*Ket([0,1]))
## @end group
## @end example
##
## @end deftypefn
##

function PrintProbs (invek)
	tmp = abs(invek).^2;
	
	for i = 1:length(invek)
		printf("%f |%d>\n",tmp(i),i-1);
	end

end
