## -*- texinfo -*-
## @deftypefn {Function file} {} vnentropy(s)
##  Function @code{H} calculates vnentropy of mixed (or pure) state
## @var{s} acording to the rule 
## @code{vnentropy(s)=-sum(eig(s)log2(eig(2))}
## 
## @example 
## @group
## vnentropy(MixState(State(Ket([0,0,1]),State(Ket([1,0,0]))))
##  @result{} 
##	1	
## @end group
## @end example
## @end deftypefn
##
## @seealso {partialtrace, partialtranspose, evolve, negativity}
##

function ret = vnentropy(state)
	ret = 0;
	tmp = 0;

	if ( nargin ~= 1 )
		usage ('vnentropy (state)');
	else	
		ev = eig(state); # eigenvalues of density matrix
		nb = size(ev)(1); # number of eigenvalues
		for  i = 1:nb 
			if ( ev(i) == 0.0 )
				ret = ret - 0;	
			else
				ret = ret - ev(i)*log2(ev(i));
			endif
		endfor
	endif
endfunction