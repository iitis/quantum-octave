function ret = RotZ(th)
    ret = [exp(-i*th/2),0;0,exp(i*th/2)];
endfunction
