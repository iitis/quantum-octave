## -*- texinfo -*-
## @deftypefn {Function file} {} CNot(@var{size},@var{contrv},@var{targetv})
## Function @code{CNot} returns controled Not operation on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  CNot (2,[2],[1])
##  @result{} 
##  1  0  0  0  
##  0  0  0  1  
##  0  0  1  0
##  0  1  0  0  
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Not, ControledGate}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 23 February 2003
##
## Last modification : 10 February 2004

function ret = CNot(size,contrv,targetv)

if(nargin!=3)
	usage("CNot(size,contrv,targetv)\n");
endif
if(!is_scalar(size))
	error("1st parameter should be scalar");
endif

if(size < max(max(contrv),max(targetv)))
	error("Operator acts on %d qubits, max control index is %d, max target index is %d", size, max(contrv), max(targetv));
endif

proj1 = [0,0;0,1];

sort(contrv);
sort(targetv);

flags = zeros(1,size);

for i = 1:length(contrv)
	ctmp = contrv(i);
	flags(ctmp) = 1;
endfor

for i = 1:length(targetv)
	ttmp = targetv(i);
	if flags(ttmp) != 0
		error("arguments overlaping");
		return;
	else
	flags(ttmp) = 2;
	endif
endfor

# initialization

ret = Id(size);

if (flags(1) == 1)
	tmp = proj1;
elseif (flags(1) == 2)
	tmp = Id(1) - Not;
elseif (flags(1) == 0)
	tmp = Id(1);
else
	error("unknown error occured");
endif

# matrix building

for i = 2:size
if (flags(i) == 1)
	tmp = kron(tmp,proj1);
elseif (flags(i) == 2)
	tmp = kron(tmp,Id(1) - Not);
elseif (flags(i) == 0)
	tmp = kron(tmp,Id(1));
else
	error("unknown error occured");
endif
endfor

tmp = Id(size) - tmp;

ret = tmp;

endfunction
