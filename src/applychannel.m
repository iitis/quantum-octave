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

	if (nargin==1 || isempty(state))
		global quantum_octave_state;
		state=quantum_octave_state;
		
		tmp=qzeros(size(state,1));
		
		for idx=[1:noEl]
			tmp += elements{idx}*quantum_octave_state*elements{idx}';
		endfor
		quantum_octave_state=tmp;
	else
		ret=qzeros(size(state));
	
		for idx=[1:noEl]
			ret += elements{idx}*state*elements{idx}';
		endfor
	endif
endfunction
