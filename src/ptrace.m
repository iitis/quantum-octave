## -*- texinfo -*-
## @deftypefn {Function file} {} ptrace(state, targv)
## Function @code{PTrace} returns density matrix obtained
## from matrix @var{state} by tracing out subspace of targv
## listed in @var{targv}. This function uses matrix 
## multiplication.
##
## @example 
## @group
## PTrace(State(Ket([0,0,0])),[1,2])
##  @result{} 
##	1 0
##	0 0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ProductGate, PTranspose}
##

function ret = ptrace(state,targv)
	if ( nargin ~= 2 )
		usage ('ptrace(state,targv)');
	end

	dimb=2^length(targv);
	dima=size(state,2)/(dimb);

	ntargv=log2(size(state,2));
	perm=[complement(targv,[1:ntargv]) targv];
	
	pm=qubitpermutation(perm);
	
	state=evolve(pm,state);
	
	ret=qzeros(dima);
	
	for i=[1:dima]
		for j=[1:dimb]
			for k=[1:dima]
				l=j;
				x=(i-1)*dimb+j;
				y=(k-1)*dimb+l;
				ret(i,k)=ret(i,k)+state(x,y);
			endfor
		endfor
	endfor

endfunction