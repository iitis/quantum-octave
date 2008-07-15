## -*- texinfo -*-
## @deftypefn {Function file} {} isstate(@var{mtx},@var{verb})
## Function @code{isstate} returns @code{1} if matrix @var{mtx} 
## is vailid density matrix and @code{0} if it is not. 
## If the second argument  @code{verb} is set to 1, then
## function will inform why the entered matrix is not a state.
## 
## @example 
## @group
## isstate(State(Ket([0,0,0])))
##  @result{} 
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {state, mixstates}
##

function ret = isstate(mtx, verb)
	if ( nargin != 1 && nargin != 2 )
		usage ('isstate (mtx[, verb = 0 | 1 ])');
	else
	
	norm = false;
	sadj = false;
	posi = false;
	why1 = ' ';
	why2 = ' ';
	why3 = ' ';
	
	if (nargin > 2 && nargin < 1)
		usage ('isstate (state,[verb])');
	else
		
		# test if tr(mtx) = 1
		if ( trace(mtx) == 1 )
			norm = true;
		else
			why1 = 'not normalized';
		endif
		
		# test if mtx = mtx'
		if ( mtx == mtx')
			sadj = true;
		else
			why2 = 'not selfadjoint';
		endif
		
		# test if matrix is ppositive
		if ( min(eig(mtx)) < 0 )
			why3 = 'not positive definde';
		else
			posi = true;
		endif
	endif
		
	if ( norm && sadj && posi )
		ret = true;
	elseif ( nargin == 2 && verb == 1 )
		printf('This matrix is not vaild state: is %s %s %s\n',why1,why2,why3);
		ret = false;
	else
		ret = false;
	endif
	
	endif
endfunction
