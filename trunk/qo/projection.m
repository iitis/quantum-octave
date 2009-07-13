## -*- texinfo -*-
## @deftypefn{Function file} {} projection(@var{vec}) returns projection 
## operator defined as |@var{vec}><@var{vec}|.
## @example 
## @group
## projection([1,0,1])
##  @result{}
## 0  0  0  0  0  0  0  0
## 0  0  0  0  0  0  0  0
## 0  0  0  0  0  0  0  0
## 0  0  0  0  0  0  0  0
## 0  0  0  0  0  0  0  0
## 0  0  0  0  0  1  0  0
## 0  0  0  0  0  0  0  0
## 0  0  0  0  0  0  0  0
## @end group
## @end example
## @end deftypefn
## @seealso {id, sx, h, phase}
## 

function ret = projection(vec)
	if (nargin<1)
		help projection;
		return;
	endif
	if(!isbinvec(vec))
		error('projection: Binary vector expected!');
	endif
	ret = ket(vec)*ket(vec)';
endfunction