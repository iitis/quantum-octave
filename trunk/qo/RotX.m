## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = RotX(th)
    ret = [cos(th/2),-i*sin(th/2);-i*sin(th/2),cos(th/2)];
endfunction
