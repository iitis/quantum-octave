## -*- texinfo -*-
## @deftypefn {Function file} {} WernerSinglet(@var{param},@var{dim})
## Function @code{WernerSinglet} returns density matrix for Werner state, 
## which consists of admixture of maximaly mixed state to singlet state
## in @code{dxd} Hilbert space with parameter @var{param}. 
## If second argument is ommited it returns Werner state for two qubits.
## 
## @example 
## @group
## WernerSinglet(.5)
##  @result{} 
##	0.37500 0.00000 0.00000 -0.25000
##	0.00000 0.12500 0.00000 0.00000
##	0.00000 0.00000 0.12500 0.00000
##	-0.25000 0.00000 0.00000 0.37500
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Werner, GHZ, W, Phip, PhiM, PsiP, PsiM}
##

function ret = WernerSinglet(param, dim)
if ( nargin < 1 || nargin > 2 )
	usage ("WernerSinglet (param, [ dim ])")
endif

if ( nargin == 2 )
	warning ("Function not fully implemented!");
	warning ("Second argument will be ignored!");
endif

if ( !isscalar (param) ) 
	error ("First argument should be scalar!");
endif

# returned state for two qubits
ret = 0.25 * (1 - param) * [1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1] + param * [.5,0,0,-.5;0,0,0,0;0,0,0,0;-.5,0,0,.5];

endfunction
