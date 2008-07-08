## -*- texinfo -*-
## @deftypefn {Function file} {} state(@var{ket})
## Function @code{state} returns density matrix representing state @var{ket}. Density matrix is vailid if state is normalized.
## 
## @example 
## @group
## state(normalize(ket([0,1])+ket([1,0])))
##  @result{} 
## 0.00000  0.00000  0.00000  0.00000
## 0.00000  0.50000  0.50000  0.00000
## 0.00000  0.50000  0.50000  0.00000
## 0.00000  0.00000  0.00000  0.00000
## @end group
## @end example
##
## @end deftypefn
## @seealso {normalize}
##

function ret = state(ket)
    ret = ket*ket';
endfunction