## -*- texinfo -*-
## @deftypefn{Function file} {} ischannel(@var{elements})
## Function @code{ischannel} generalized quantum evolution on the state @var{state}.
## @example
## @group
## applychannel(state(ket([0,1])), { sqrt(0.5)*id(),(sqrt(1-0.5))*sz })
##  @result{}
##
## @end group
## @end example
## @end deftypefn
## @seealso {isone, isunitary}

function ret = ischannel(elements)
	if (nargin!=1)
		usage("ischannel(elements)")
	endif
	if (!iscell(elements) )
		error('ischannel: First argument must be a cellarray!');
	endif
	
	# dimension of the state
	noEl = size(elements)(2);

	m=zeros(size(elements{1}));

	for idx=[1:noEl]
		tmp = elements{idx}'*elements{idx};
		m = m+tmp;
	endfor
	if isone(m)
		ret=true;
	else
		ret=false;
	endif	
endfunction
