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



proj0 = [1,0;0,0];
proj1 = [0,0;0,1];

# sort input
lc = sort(contrv); # control list
lt = sort(targetv); # targe list

flags = zeros(1,gatesize);

for i = 1:length(lc)
	ctmp = lc(i);
	flags(ctmp) = 1; # control==1
endfor

for i = 1:length(lt)
	ttmp = lt(i);
	if (flags(ttmp) == 1)
		error("Arguments overlaping!");
		return;
	else
		flags(ttmp) = 2;  # target==2
	endif
endfor

# initialization
ret = Id(gatesize);

# matrix building - case |111...>
tmp = 1;

for i = 1:gatesize
if (flags(i) == 1)
	tmp = kron(tmp,proj1);
elseif (flags(i) == 2)
	tmp = kron(tmp,gate);
elseif (flags(i) == 0)
	tmp = kron(tmp,Id(1));
else
	error("Internal error occured, it should never happen :-(!");
endif
endfor

ret = tmp;

#matrix building - other cases
tmp=1;
for j = 0:2^(size(lc)(2))-2 # for each control qubit
#genereate permutation of 0 and 1
perm = Dec2BinVec(j,size(lc)(2));
pi=1; # permutation index
	for i = 1:gatesize
		if (flags(i) == 1) # it is control 
			if(perm(pi)==0)
				pi++;
				tmp = kron(tmp,proj0);
			elseif(perm(pi)==1)
				pi++;
				tmp = kron(tmp,proj1);
			else
				error("Internal error occured, it should never happen :-(!");				
			endif
		elseif (flags(i) == 2) # it is target, then put Id
			tmp = kron(tmp,Id(1));
		elseif (flags(i) == 0)
			tmp = kron(tmp,Id(1));
		else
			error("Internal error occured, it should never happen :-(!");
		endif
	endfor
ret += tmp;
tmp=1;
endfor




endfunction
