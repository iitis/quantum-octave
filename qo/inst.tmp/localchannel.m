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

function ret = localchannel(_size, kraus, targetv)
if ( nargin < 2 )
	usage ('localchannel(size, kraus_cell_arr, [, targetv])');
endif
if ( nargin == 2 )
	targetv=[1:_size];
endif

	ret_size=2^_size;
	retcount=length(kraus)^length(targetv);

	ret={};
	target=zeros(1,_size);
	for k=targetv
		target(k)=1;
	endfor

	for i=[0:retcount-1]
		idx=dec2basevec(i,length(kraus),length(targetv))+1;
		op=1;
		a=1;
		for k=[1:_size]
			if (target(k)==1)
				op=kron(op,kraus{idx(a)});
				a=a+1;
			else
				op=kron(op,Id);
			endif
		endfor
		ret{i+1}=op;
	endfor
endfunction