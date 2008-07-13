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

function ret = ischannel(elements)
	if (nargin>1)
		help ischannel;
		return;
	endif
	if (!iscell(elements) )
		error('ischannel: First argument must be a cellarray!');
	endif
	
	# dimension of the state
	noEl = size(elements)(2);

	ret=zeros(size(elements{1}));

	for idx=[1:noEl]
		tmp = elements{idx}'*elements{idx};
		ret = ret+tmp;
	endfor
 
endfunction
