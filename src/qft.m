## -*- texinfo -*-
## @deftypefn {Function file} {} qft(qubits)
## Function @code{qft} returns quantum fourier transform
## for given number of @var{qubits}.
##
## @end deftypefn
##
## @seealso {h, id, productgate}
##

function ret = qft(qubits)
	if (nargin!=1)
		usage('qft(qubits)');
	endif
	
	n=qubits;
	twopowN = 2^n;
	twopii = 2*pi*i;
	ret = zeros(twopowN);
	
	for x=[0:twopowN-1]
		for y=[0:twopowN-1]
			ret(x+1,y+1)=e^(twopii*x*y/(twopowN));
		endfor
	endfor
	ret = (1/sqrt(twopowN))*ret;
endfunction