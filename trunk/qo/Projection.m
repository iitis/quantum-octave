## -*- texinfo -*-
## @deftypefn{Function file} {} Projection(@var{vec}) returns projection 
## operator defined as |@var{vec}><@var{vec}|.
## @example 
## @group
## Projection([1,0,1])
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
## @seealso {Id, Not, H, Pase}
## 

function ret = Projection(vec)
	if(!IsBinVec(vec))
		error("Binary vector expected!");
	end
	
	ret = Ket(vec)*Ket(vec)';
end
