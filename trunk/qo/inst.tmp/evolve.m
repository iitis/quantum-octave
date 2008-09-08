## -*- texinfo -*-
## @deftypefn {Function File} {} evolve (@var{gate},@var{state})
## @deftypefnx {Function File} {} evolve (@var{gate}})
## This function performs unitary evolution described by gate @var{gate} on the state @var{state}.
## 
## For example:
## @example
## @group
## evolve(productgate (2,not,[1,2]),state (ket ([0,1])))
## @result{}
##	0  0  0  0
##	0  0  0  0
##	0  0  1  0
##	0  0  0  0
## @end group
## @end example
## @end deftypefn
## @seealso{ state, productgate }
##

function ret = evolve(evolution, state)
	if ( nargin < 1 || nargin > 3)
		usage("evolve(evolution[, state])")
	endif
	if (nargin==2)
		ret = evolution*state*evolution';
	else
		global quantum_octave_state;
		quantum_octave_state = evolution*quantum_octave_state*evolution';
	endif
endfunction