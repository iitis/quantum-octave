## -*- texinfo -*-
## @deftypefn {Function file} {} isbinvec(@var{vec})
## This is helper function which returns true if @var{vec}
## is of the form @code{[b1,b2,...,bn]} where @code{bi = 0}
## or @code{bi = 1} for every @code{i}.
## 
## @example 
## @group
## isbinvec([0,1,2])
##  @result{} 
##	0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {Dec2BinVec, dec2bin}
##

function ret = isbinvec(vec)
    ret = false;
    if ( nargin ~= 1 )
      help isbinvec;
			return;
    endif

    if (isvector(vec))
        vs = size(vec,2);
        for i = 1:vs
            if ( (vec(i) ~= 1) && (vec(i) ~= 0) )
                ret = false;
                return;
            endif
        endfor
        ret = true;
    endif
endfunction
