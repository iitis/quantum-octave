## -*- texinfo -*-
## @deftypefn {Function file} {} BuildBinaryVector(@var{indx},@var{binvec},@var{binnum},@var{qubits})
## Function @code{BuildBinaryVector} returns a  @code{Ket} base vector  in @var{qubits}-qubits Hilbert 
## space labeled with number constructed as follows. Every bit of this number which is listed in @var{indx}
## is sert according with @var{binnum}, other bits are complemented using @var{binnum}.
## Note: @var{binvec} and @var{binnum} must be binary vectors such that 
## @code{length of binvec + length of binnum = qubits}.
## 
## @example 
## @group
## BuildBinaryVector([1,2],[1,0],[1,1],4)
##  @result{} 
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  0
##  1
##  0
##  0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Id, Not}
##
## Author: Piotr Gawron, Jaroslaw Miszczak.
## Created: 8 March 2005,
## Last modyfication: 16 March 2004.

function ret = BuildBinaryVector(qidx, binvec, binnum, qubits)
indx = sort(qidx);

is = size(indx)(2); # number of bits for substitution
bs = size(binvec)(2); # number of bits in substuitution list
ns = size(binnum)(2); #number of bits in complementation

# test validity of call

if ( is != bs )
	error("Size of first (=%d) and second argument (=%d) do not match!",is, bs);
endif

if ( bs + ns != qubits )
	error("Wrong number of qubits: size of binvec  = %d, size of binnum = %d, qubits = %d", bs, ns, qubits );
endif

if ( indx(is) > qubits )
	error("Too large qubit index (=%d) in first argument!", indx(is));
endif

# local variables for looping over binvec and binnum lists
qi = 1;
bi = 1;

# build temporary vector
temp  = zeros(1,qubits);

for i=1:qubits
	if ( qi <= is && i == indx(qi) )
		temp(i) = binvec(qi);
		qi++;
	elseif ( bi <= ns )
		temp(i) = binnum(bi);
      	bi++;
	endif
endfor
ret = Ket(temp);
endfunction

