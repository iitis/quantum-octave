## -*- texinfo -*-
## @deftypefn{Function file} {} Name([@var{size}] )
## Function @code{Id(@var{size})} returns 2^size x 2^size dentity
## matrix, argument is optional, if not suplied is set to 1.
## 
## @example 
## @group
## Name(2)
##  @result{}
##	1  0  0  0 
##	0  1  0  0
##	0  0  1  0
##	0  0  0  1
## @end group
## @end example
## @end deftypefn
## @seealso {Id, Not, H, Pase}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 12 December 2003

function ret = Measure(state)
  state_size = size(state)(1);
#  qubit_count = log2(state_size)
  
  ret = zeros(2,state_size);
  ret(1,:) = 0:state_size-1;
  temp = zeros(state_size);
  
  temp(1,1)=1;
  ret(2,1)=trace(temp*state);

  for i=2:state_size
  temp(i-1,i-1)=0;
  temp(i,i)=1;
  
  ret(2,i)=trace(temp*state);
  endfor
 ret = ret'; 
endfunction
