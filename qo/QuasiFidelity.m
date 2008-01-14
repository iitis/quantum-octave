function ret = QuasiFidelity(a,b)
ret = trace (a*b) + sqrt((1-trace(a*a)*(1-trace(b*b))));
end
