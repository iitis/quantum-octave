## -*- texinfo -*-
## @deftypefn {Function file} {} State(@var{ket})
## Function @code{State} returns density matrix representing state @var{ket}. Density matrix is vailid if state is normalized.
## 
## @example 
## @group
## State (Normalize(Ket([0,1])+Ket([1,0])))
##  @result{} 
## 0.00000  0.00000  0.00000  0.00000
## 0.00000  0.50000  0.50000  0.00000
## 0.00000  0.50000  0.50000  0.00000
## 0.00000  0.00000  0.00000  0.00000
## @end group
## @end example
##
## @end deftypefn
## @seealso {Normalize}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = State(ket)
    ret = ket*ket';
endfunction
