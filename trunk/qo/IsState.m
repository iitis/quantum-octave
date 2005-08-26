## -*- texinfo -*-
## @deftypefn {Function file} {} IsState(@var{mtx},@var{verb})
## Function @code{IsPPT} returns @code{1} if matrix @var{mtx} is 
## vailid density matrix and @code{0} if it is not. If second argument 
## is @code{verb}
## 
## @example 
## @group
## IsPPT(State(Ket([0,0,0])))
##  @result{} 
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {State, MixStates}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 22 March 2004
## Last modyfication: 14 July 2005

function ret = IsState(mtx, verb)
if ( nargin != 1 && nargin != 2 )
  usage ("IsState (mtx, [ verb = 0 | 1 ])");
else

norm = false;
sadj = false;
posi = false;
why1 = "";
why2 = "";
why3 = "";

if (nargin > 2 && nargin < 1)
	usage ("IsState (state,[verb])");
else
	# test if tr(mtx) = 1
	if ( trace(mtx) == 1 )
		norm = true;
	else
		why1 = "not normalize";
	endif
	# test if mtx = mtx'
	if ( mtx == mtx')
		sadj = true;
	else
		why2 = "not selfadjoint";
	endif
	# test if matrix is ppositive
	if ( min(eig(mtx)) < 0 )
		why3 = "not positive definde";
	else
		posi = true;
	endif
	endif
	
	if ( norm && sadj && posi )
		ret = true;
el	seif	( nargin == 2 && verb == 1 )
		printf("This matrix is not vaild state: is %s %s %s\n",why1,why2,why3);
		ret =  false;
	else
	ret = false;
endif
endif
endfunction
