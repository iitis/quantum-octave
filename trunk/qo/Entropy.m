## -*- texinfo -*-
## @deftypefn {Function file} {} Entropy(s)
##  Function @code{H} calculates entropy of mixed (or pure) state
## @var{s} acording to the rule 
## @code{Entropy(s)=-sum(eig(s)log2(eig(2))}
## 
## @example 
## @group
## Entropy(MixState(State(Ket([0,0,1]),State(Ket([1,0,0]))))
##  @result{} 
##	1	
## @end group
## @end example
## @end deftypefn
##
## @seealso {PTrace, PTranspose, Evolve, Negativity}
##

function ret = Entropy(state)
	ret = 0;
	tmp = 0;

	if ( nargin != 1 )
		usage ("Entropy (state)");
	else	
		ev = eig(state); # eigenvalues of density matrix
		nb = size(ev)(1); # number of eigenvalues
		for  i = 1:nb 
			if ( ev(i) == 0.0 )
				ret -= 0;	
			else
				ret -= ev(i)*log2(ev(i));
			endif
		endfor
	endif	

	if (ret < 10e-15) 
		ret = 0.0;
	endif	
endfunction
