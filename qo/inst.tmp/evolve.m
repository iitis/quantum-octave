## -*- texinfo -*-
## @deftypefn {Function File} {} evolve (@var{gate},@var{state})
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
if ( nargin ~= 2 )
	usage ('evolve (untiary, state)');
end
	ret = evolution*state*evolution';
end
