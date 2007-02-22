## -*- texinfo -*-
## @deftypefn {Function file} {} PrintAmps(@var{ket})
## Function @code{PlotAmps} prints amplitude of @var{ket} vector in standard base.
## Try this:
## @example 
##  @group
## PrintAmps(Ket([1,1,0]))
## PrintAmps(Ket([1,0])+Ket([0,1]))
## PrintAmps(Ket([1,0])+i*Ket([0,1]))
## @end group
## @end example
##
## @end deftypefn
##

function PrintAmps (invek)
if (!is_vector(invek))
	error("input vector is not a vector");
end

if (ceil(log2(size(invek)))!=floor(log2(size(invek))))
	error("input vektor should be of size 1x2^n")
else
	for i = 1:length(invek)
		temp = invek(i);
		if(!iscomplex(temp))
			printf("%+f\t\t",temp);
		else
			printf("%+f + %fi\t",real(temp),imag(temp));
		end
		printf("|%d>\n",i-1);
	end
end

end
