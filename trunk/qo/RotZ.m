## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = RotZ(th)
    ret = [exp(-i*th/2),0;0,exp(i*th/2)];
endfunction
