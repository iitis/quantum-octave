function ret = prob_ent(st, x, y)
b(x);
b(x);
obs = Projection([b(x),b(y)]);
ret = trace(st*obs);
endfunction
