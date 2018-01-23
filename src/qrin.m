## -*- texinfo -*-
## @deftypefn {Function file} {} controlledgate(@var{size},@var{gate},@var{contrv},@var{targetv})
## Function @code{controlledgate} returns controled operation @var{gate} on qubits @var{targetv} 
## controled by @var{contrv}. Size of the result gate is given by @var{size}.
## @example 
## @group
##  controlledgate (2,Not,[1],[2])
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
## @seealso {id, sx, h, rotx, roty, rotz}
##

function ret = qrin(register,intset)
 	if(nargin!=2)
 		usage('qrin(register,intset)');
		return;
 	endif
	
	ret={};
	ret.t={};
	ret.f={};
	for i=[1:length(intset)]
		ret.t{i}=setdiff(dec2binvec(intset(i),length(register)).*register,0);
	endfor
	cointset=complement(intset,[0:2^length(register)-1]);
	for i=[1:length(cointset)]
		ret.f{i}=setdiff(dec2binvec(cointset(i),length(register)).*register,0);
	endfor
	ret.register=register;
# 	ret.t=intset;
# 	ret.f=cointset;
endfunction