## -*- texinfo -*-
## @deftypefn {Function file} {} PhiAddInt(@var{int},@var{qubits})
## Function @code{PhiAddInt} returns gate that adds given @var{int}eger on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @end example
##
## @end deftypefn
##
## @seealso {}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 31 May 2004


#BROKEN
function ret = PhiAddInt(int,qubits)
error("DOES NOT WORK")
if(nargin!=2)
	usage("PhiAddInt(int,qubits)");
endif

v = Dec2BinVec(int, qubits)

for k=[1:qubits]
	#GATES{k}= [1,0;0,exp( 2*i*pi/2^k )];
	GATES{k} = Phase(2*pi/(2^k));
endfor

pg= 1;

for l=[1:qubits]
	for k=[1:qubits] 
		g=Id(1);
		if(v(k)==1) 
			g = Circuit(g, GATES{k});
		endif
	endfor
	pg = Kron(pg, g);
endfor
 	
ret = pg;

endfunction
