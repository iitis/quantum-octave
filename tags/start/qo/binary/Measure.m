## -*- texinfo -*-
## @deftypefn{Function file} {} Measure(@var{state})
## Function @code{Measure} performs ortogonal measurment on state @var{state}. Function returns a probability distribution of results. 
## @example 
## @group
## Measure(State(Ket([1,0,1])))
##  @result{}
## 0  0
## 1  0
## 2  0
## 3  0
## 4  0
## 5  1
## 6  0
## 7  0
##
## @end group
## @end example
## @end deftypefn
## @seealso {Id, Not, H, Pase}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak.
## Created: 12 December 2003.
## Last modyfication: 10 February 2004.

function ret = Measure(state, observables, str)
#TODO test if state is valid state and if observables are in form "XYZZYXI"

flag=-1; # 0 - return measured state (default); 1 - return structure

lobservables = observables;


if(nargin==2)
	flag=0;
elseif(nargin==3)
	if(strcmp("state",str))
		flag=0;
	elseif(strcmp("struct",str))
		flag=1;
	else
		usage("Measure(state, observables[, {\"state\"|\"struct\"}])");
	endif
else
	usage("Measure(state, observables[, {\"state\"|\"struct\"}])");
endif

qs = log2(size(state)(2)); # number of qubits in state

if (size(lobservables)(2)!=qs)
	error("Observables description and state size do not match");
endif


chosestate=false; # true if we want to return state vector
if (flag==0) 
	chosestate=true;
else
	chosestate=false;
endif

lo = length(lobservables);

listobs = {};
for i=lo+1-[1:lo]
	if (lobservables(i)=="X")
		listobs(i)=Observable(0.5*Sx);
	elseif (lobservables(i)=="Y")
		listobs(i)=Observable(0.5*Sy);
	elseif (lobservables(i)=="Z")
		listobs(i)=Observable(0.5*Sz);	
	elseif (lobservables(i)=="I")
		temp(1).l = 1;
		temp(2).l = 1;
		temp(1).proj = Id(1);
		temp(2).proj = Id(1);
		listobs(i)=temp;
	elseif
		error("Unexpected %s found, it should be {X,Y,Z,I}",observables(i));
	endif
endfor

random = rand();	# used during chosing of random output state
cumprob = 0; 		# cumulative probability

prob.out=0; 	# eigenvalue
prob.p=0;	# probability	

retstate = zeros(size(state)(2)); # state we return
rettemp=1;
reteigval=-1;

for j=0:2^lo-1 # for every possible projection
	projection=[1]; # projection operator obtained by spectral decomposition
	indexes = Dec2BinVec(2^lo - j - 1,lo)+1; # generation of all combinations of set {1,2}
	prob(j+1).out=zeros(1,lo);
	for i=1:lo
		projection = kron(projection,nth(listobs,i)(indexes(i)).proj);
		prob(j+1).out(i)=nth(listobs,i)(indexes(i)).l;
		prob(j+1).out=prob(j+1).out;
	endfor
#*	projection
	p = trace(state*projection); # compute probability 
	prob(j+1).p = p;
	cumprob+=p; # to draw state

#* 	STAN = (projection*state*projection)/p

	if(chosestate && (cumprob>random)) # so we are building state after measurment
		chosestate = false;
		rettemp = (projection*state*projection)/p;
		retstate = rettemp;
		reteigval = prob(j+1).out;
	endif
endfor
if(flag==0)
	ret.state = retstate;
	ret.eigval = reteigval;
elseif(flag==1)
	ret = prob;
else
	error("Internal error - it should never happen!");
endif
endfunction
