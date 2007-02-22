## -*- texinfo -*-
## @deftypefn {Function file} {} RotZ(@var{real})
## Function @code{RotZ} returns 2x2 matrix, that is
## 
## @example 
## @group
## RotZ(pi/2)
##  @result{} 
## 0.70711 - 0.70711i  0.00000 + 0.00000i
## 0.00000 + 0.00000i  0.70711 + 0.70711i
## @end group
## @end example
##
## @end deftypefn
## 

function ret = RotZ(th)
    ret = [exp(-i*th/2),0;0,exp(i*th/2)];
end
