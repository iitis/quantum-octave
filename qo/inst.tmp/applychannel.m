## -*- texinfo -*-
## @deftypefn{Function file} {} applychannel(@var{state})
## Function @code{applychannel} generalized quantum evolution on the state @var{state}.
## @example
## @group
## applychannel(state(ket([0,1])), { sqrt(0.5)*id(),(sqrt(1-0.5))*sz })
##  @result{}
##
## @end group
## @end example
## @end deftypefn
## @seealso {}

function ret = applychannel(elements, state)
	if (nargin>2)
		usage('applychannel (elements_cell_arr,state)');
	endif
	if (!iscell(elements) )
		error('First argument must be a cellarray!');
	endif
	
	# dimension of the state
	noEl = size(elements,2);

	ret=zeros(size(state));

	for idx=[1:noEl]
		tmp = elements{idx}*state*elements{idx}';
		ret = ret+tmp;
	endfor
endfunction
