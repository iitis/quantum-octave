## -*- texinfo -*-
## @deftypefn {Function File} {} evolve (@var{gate},@var{state})
## This function performs unitary evolution described by gate @var{gate} on the state @var{state}.
## The function returns cell array of Kraus operators.
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
## TODO: doc!

function ret = localchannel(kraus, targetv, chsize)
	if (nargin==2 || isempty(chsize))
		chsize=length(quantum_register_allocated));
	endif
	if ( nargin < 2 || nargin > 3)
		usage ('localchannel(size, kraus_cell_arr, [, targetv])');
	endif

	retchsize=2^chsize;
	retcount=length(kraus)^length(targetv);

	ret={};
	target=zeros(1,chsize);
	for k=targetv
		target(k)=1;
	endfor

	for i=[0:retcount-1]
		idx=dec2basevec(i,length(kraus),length(targetv))+1;
		op=1;
		a=1;
		for k=[1:chsize]
			if (target(k)==1)
				op=__kron(op,kraus{idx(a)});
				a=a+1;
			else
				op=__kron(op,id);
			endif
		endfor
		ret{i+1}=op;
	endfor
endfunction