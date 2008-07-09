## -*- texinfo -*-
## @deftypefn{Function file} {} applychannel(@var{state})
## Function @code{applychannel} generalized quantum evolution on the state @var{state}.
## @example
## @group
## applychannel(state(ket([0,1])), { sqrt(0.5)*Id(),(1-sqrt(0.5))*sz })
##  @result{}
##
## @end group
## @end example
## @end deftypefn
## @seealso {}

function ret = applychannel(state,elements)
warning("function applychannel is broken")
	if (nargin>2)
		usage('applychannel (state, elements_cell_arr)');
	end
	if (!iscell(elements) )
		error('Second argument must be a cellarray!');
	end
	
	# dimension of the state
	noEl = size(elements)(2);

	for i=[1:noEl]
		tmp = elements{idx}*state*elements{idx}';
		ret += tmp;
	end
 
end
