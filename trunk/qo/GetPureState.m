## -*- texinfo -*-
## @deftypefn {Function File} {} GetPureState(@var{state})
## The @code{GetPureState} function returns pure state coresponding 
## to density matrix @var{state}. If @var{state} cannot be decompose
## in unique way, it returns @code{NaN}.
##
## @example
## @group
## GetPureState(MaxMix(2))
## @result{}	
##	NaN
## @end group
## @end example
## @end deftypefn
## @seealso{Entropy, Id, H, Phase}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 26 March 2004

function ret = GetPureState(state)
if ( nargin != 1 )
	usage("GetPureState (mixed_state)");
endif
	[v,l] = eig(state);
	sl = size(l)(2);
	if( l(sl, sl) - 1 < 0.0001)
		ret = v(:,size(v)(2));
	else
		ret = NaN;	
	endif
endfunction
