## -*- texinfo -*-
## @deftypefn{Function file} {} Projection(@var{vec}) returns projection operator defined as |@var{vec}><@var{vec}|.
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
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 12 December 2003

function ret = Projection(vec)
#should test if valid binary vector
  ret = State(Ket(vec));
endfunction
