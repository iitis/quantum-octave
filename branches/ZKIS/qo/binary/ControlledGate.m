## -*- texinfo -*-
## @deftypefn {Function file} {} ControlledGate(@var{size},@var{gate},@var{contrv},@var{targetv})
## Function @code{ControlledGate} returns controled operation @var{gate} on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  ControlledGate (2,Not,[1],[2])
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

function ret = ControlledGate(gatesize,gate,contrv,targetv)

if(nargin!=4)
	usage("ControlledGate(gatesize,gate,contrv,targetv)");
endif
if(!isscalar(gatesize))
	error("1st parameter should be scalar!");
endif
if(issquare(gate)!=2)
	error("2nd parameter should be matrix 2x2!");
endif

if(gatesize < max(max(contrv),max(targetv)))
	error("Operator acts on %d qubits, max control index is %d, max target index is %d!", gatesize, max(contrv), max(targetv));
endif


if(size(targetv)(2)!=1)
	error("Sorry this function is not implemented yet :-( !")
endif

proj1 = [0,0;0,1];

lc = sort(contrv);
lt = sort(targetv);

flags = zeros(1,gatesize);

for i = 1:length(lc)
	ctmp = lc(i);
	flags(ctmp) = 1;
endfor

for i = 1:length(lt)
	ttmp = lt(i);
	if (flags(ttmp) != 0)
		error("Arguments overlaping!");
		return;
	else
		flags(ttmp) = 2;
	endif
endfor

# initialization
ret = Id(gatesize);


# matrix building
tmp = 1;

for i = 1:gatesize
if (flags(i) == 1)
	tmp = kron(tmp,proj1);
elseif (flags(i) == 2)
	tmp = kron(tmp,Id(1) - gate);
elseif (flags(i) == 0)
	tmp = kron(tmp,Id(1));
else
	error("Internal error occured, it should never happen :-(!");
endif
endfor

tmp = Id(gatesize) - tmp;

ret = tmp;

endfunction
