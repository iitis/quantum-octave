function ret = ShorNoise(state, er, pos)

lstate = Encode(state, "shor");

lstate = Evolve(ProductGate(9,er,[pos]),lstate);

lstate = Decode(lstate, "shor");

lstate = Recover(lstate, "shor");

ret = lstate;
endfunction
