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

function ret = qrle(register,integer)
 	if(nargin!=2)
 		usage('qrle(register,integer)');
		return;
 	endif

	ret{1}=[];
	ret{2}=[];
	r=min([integer,2^length(register)-1]);
	for i=[0:r] 
# 		ret.ifpart{i+1}=setdiff(dec2binvec(i,length(register)).*register,0);
		ret{1}(i+1)=i;
	endfor
	for i=[r+1:2^length(register)-1] 
		ret{2}(i-r)=i;
	endfor
endfunction