## -*- texinfo -*-
## @deftypefn {Function File} {} Evolve (@var{gate},@var{state})
## This function performs unitary evolution described by gate @var{gate} on the state @var{state}.
## 
## For example:
## @example
## @group
## Evolve(ProductGate (2,Not,[1,2]),State (Ket ([0,1])))
## @result{}
##	0  0  0  0
##	0  0  0  0
##	0  0  1  0
##	0  0  0  0
## @end group
## @end example
## @end deftypefn
## @seealso{ State, ProductGate }
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = Evolve(evolution, state)
	ret = evolution*state*conj(evolution);
endfunction
