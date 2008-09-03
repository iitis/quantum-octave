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

function ret = qror(expr1,expr2)
 	if(nargin!=2)
 		usage('qror(expr1,expr2)');
		return;
 	endif
	if(intersection(expr1.register,expr2.register))
		error("qrand: arguments overlapping")
	endif	

	ret={};
	ret.t={};
	ret.f={};

	for i=[1:length(expr1.t)]
		for j=[1:length(expr2.t)]
			ret.t={ret.t{}, union(expr1.t{i}, expr2.t{j})};
		endfor
	endfor

	for i=[1:length(expr1.t)]
		for j=[1:length(expr2.f)]
			ret.t={ret.t{}, union(expr1.t{i}, expr2.f{j})};
		endfor
	endfor

	for i=[1:length(expr1.f)]
		for j=[1:length(expr2.t)]
			ret.t={ret.t{}, union(expr1.f{i}, expr2.t{j})};
		endfor
	endfor

	for i=[1:length(expr1.f)]
		for j=[1:length(expr2.f)]
			ret.f={ret.f{}, union(expr1.f{i}, expr2.f{j})};
		endfor
	endfor

	ret.register=union(expr1.register,expr2.register);
endfunction