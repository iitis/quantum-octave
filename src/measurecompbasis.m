## -*- texinfo -*-
## @deftypefn{Function file} {} measurecombasis(@var{state})
## Function @code{measurecombasis} performs ortogonal measurment on state @var{state}. Function returns a probability distribution of results. 
## @example 
## @group
## measurecombasis(state(ket([1,0,1])))
##  @result{}
## 0  0
## 1  0
## 2  0
## 3  0
## 4  0
## 5  1
## 6  0
## 7  0
##
## @end group
## @end example
## @end deftypefn
## @seealso {Measure, Evolve, Id, Not, H, Pase}
## 

function ret = measurecompbasis(state)
	if ( nargin > 1 )
		usage ('measurecompbasis(state)');
	endif
	if ( nargin == 0 )
		global quantum_octave_state;
		state = quantum_octave_state;
	endif

	if(issquare(state))
		ret=diag(state);
	elseif(isvector(state))
		ret=state;
	else
		error("measurecompbasis: argument is not square matrix nor vevctor")
	endif
endfunction