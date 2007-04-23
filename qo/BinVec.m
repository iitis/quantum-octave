%% -*- texinfo -*-
%% @deftypefn {Function file} {} BinVec(@var{indx},@var{binvec},@var{binnum},@var{qubits})
%% Function @code{BinVec} returns a @code{Ket} base vector in 2^@var{qubits}-dimensional 
%% Hilbert space labeled with number constructed as follows. Every bit 
%% of this number which is listed in @var{indx} is set according with 
%% @var{binnum}, other bits are complemented using @var{binnum}.
%%
%% Note: @var{binvec} and @var{binnum} must be binary vectors such that 
%% @code{length of binvec + length of binnum = qubits}.
%% 
%% @example 
%% @group
%% BinVec([1,2],[1,0],[1,1],4)
%% @result{}  
%%  1 0 1 1
%%
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {Id, Not}
%%

function ret = BinVec(qidx, binvec, binnum, qubits)

% number of arguments must be equal to 4
if ( nargin ~= 4 )
	usage('BinVec (qidx,binvec,binnum,qubits)');
end

% sort bit substitution list
indx = sort(qidx);

is = size(indx,2); % number of bits for substitution
bs = size(binvec,2); % number of bits in substitution list
ns = size(binnum,2); %number of bits in complementation

% can we make it?

if ( is ~= bs )
	error('Size of first (=%d) and second argument (=%d) do not match!',is, bs);
end

if ( bs + ns ~= qubits )
	error('Wrong number of qubits: size of binvec  = %d, size of binnum = %d, qubits = %d', bs, ns, qubits );
end

if ( indx(is) > qubits )
	error('Too large qubit index (=%d) in first argument!', indx(is));
end

% it seems so...

% iterators for looping over binvec and binnum lists
qi = 1;
bi = 1;

% build temporary vector
temp  = zeros(1,qubits);

% fill the output vector
for i=1:qubits
	if ( qi <= is && i == indx(qi) )
		temp(i) = binvec(qi);
		qi=qi+1;
    elseif ( bi <= ns )
		temp(i) = binnum(bi);
		bi=bi+1;
    end
end

ret = temp;

end

