function ret = Shor15(state)
#state should be of size 7

lstate=1;

if (nargin==0)
	lstate = State(KetN(0,7));
#	lstate = KetN(0,7);
else
	lstate = state;	
endif


nq =7;

# Preparation
g = ProductGate(nq,H, [1:3]);
lstate = Evolve(g, lstate);

##########################################
#function
#y1
target = 4;
g = CNot(nq, 2,target);
lstate = Evolve(g, lstate);

#y2
target = 5;

g = CNot(nq, [2:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, [2:3]);
lstate = Evolve(g, lstate);

g = CNot(nq, [1:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, [2:3]);
lstate = Evolve(g, lstate);

#y3
target = 6;

g = ProductGate(nq, Not, 2);
lstate = Evolve(g, lstate);

g = CNot(nq, [2:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, 2);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, [2:3]);
lstate = Evolve(g, lstate);

g = CNot(nq, [1:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, [2:3]);
lstate = Evolve(g, lstate);

#y3
target = 7;

g = ProductGate(nq, Not, [1:3]);
lstate = Evolve(g, lstate);

g = CNot(nq, [1:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, [1:3]);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, 2);
lstate = Evolve(g, lstate);

g = CNot(nq, [2:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, 2);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, 3);
lstate = Evolve(g, lstate);

g = CNot(nq, [2:3],target);
lstate = Evolve(g, lstate);

g = ProductGate(nq, Not, 3);
lstate = Evolve(g, lstate);
##########################################
# end of function

# traceout
lstate = PTrace(lstate,[4:7]);


# permutation
g = Swap(3, [1,3]);
lstate = Evolve(g, lstate);

# quantum fourier transform
g = QFT(3);
lstate = Evolve(g, lstate);


ret=lstate;

endfunction