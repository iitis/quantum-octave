## -*- texinfo -*-
## @deftypefn {Function file} {} ControledGate(@var{size},@var{gate},@var{contrv},@var{targetv})
## Function @code{ControledGate} returns controled operation @var{gate} on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  ControledGate (2,Not,[1],[2])
##  @result{} 
##  1  0  0  0  
##  0  1  0  0  
##  0  0  0  1
##  0  0  1  0  
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Id, Not, H, RotX, RotY, RotZ}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
##
## Created: 25 November 2003
##
## Last modification : 10 February 2004

function ret = ControledGate(size,gate,contrv,targetv)

if(nargin!=4)
	usage("ControledGate(size,gate,contrv,targetv)\n");
endif
if(!is_scalar(size))
	error("1st parameter should be scalar");
endif
if(is_square(gate)!=2)
	error("2nd parameter should be matrix 2x2");
endif

if(size < max(max(contrv),max(targetv)))
	error("Operator acts on %d qubits, max control index is %d, max target index is %d", size, max(contrv), max(targetv));
endif

proj1 = [0,0;0,1];

lcontrv = sort(contrv);
ltargetv = sort(targetv);

flags = zeros(1,size);

for i = 1:length(lcontrv)
	ctmp = lcontrv(i);
	flags(ctmp) = 1;
endfor

for i = 1:length(ltargetv)
	ttmp = ltargetv(i);
	if (flags(ttmp) != 0)
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
	tmp = Id(1) - gate;
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
	tmp = kron(tmp,Id(1) - gate);
elseif (flags(i) == 0)
	tmp = kron(tmp,Id(1));
else
	error("unknown error occured");
endif
endfor

tmp = Id(size) - tmp;

ret = tmp;

endfunction
