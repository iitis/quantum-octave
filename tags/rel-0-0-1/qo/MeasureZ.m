## -*- texinfo -*-
## @deftypefn{Function file} {} MeasureZ(@var{state})
## Function @code{MeasureZ} performs ortogonal measurment on state @var{state}. Function returns a probability distribution of results. 
## @example 
## @group
## MeasureZ(State(Ket([1,0,1])))
##  @result{}
## 0  0
## 1  0
## 2  0
## 3  0
## 4  0
## 5  1
## 6  0
## 7  0
##
## @end group
## @end example
## @end deftypefn
## @seealso {Measure, Evolve, Id, Not, H, Pase}
## 
## Author: Piotr Gawron, Jaroslaw Miszczak.
## Created: 12 December 2003.
## Last modyfication: 9 July 2004.

function ret = MeasureZ(state)
if ( nargin != 1 )
	usage ("MeasureZ (state)");
endif
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
