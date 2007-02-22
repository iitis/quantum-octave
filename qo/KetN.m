## -*- texinfo -*-
## @deftypefn {Function File} {} KetN (@var{int}, @var{size})
## The @code{Ket} function generates vertical complex vector from
## nonnegative number @var{int} in @var{size}-qubit space. If @var{size} is
## @var{size} is ommited the smallest space proper for requested vector.
##
## @example
## @group
## KetN(3,2)
## @result{}
##	0
##	0
##	0
##	1
## @end group
## @end example
##
## @end deftypefn
##
## @seealso{Ket, State, Not, Id, H}
##

function ret = KetN (number, size)

if ( nargin==1 )
	lsize = ceil(log2(number+1));
elseif ( nargin==2 )
	lsize = size;
elseif (nargin > 2 || nargin <=0 )
	usage ("KetN (number, [size])");
endif

if(number>=2^lsize)
	error("Number too big to fit into vector space!");
endif

ret = zeros(2^lsize,1);
ret(number+1)=1;

endfunction
