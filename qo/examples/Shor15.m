function ret = Shor15(state)
#state should be of size 7

lstate=1;

if (nargin==0)
	lstate = State(KetN(0,7));
else
	lstate = state;	
endif



prep = ProductGate(7,Not, [4:7]);

lstate = Evolve(prep, lstate);

WH = ProductGate(7, H, [1:3]);

lstate = Evolve(WH, lstate);

A = CNot(7, 3, 5);
lstate = Evolve(A, lstate);

B = CNot(7, 3, 6);
lstate = Evolve(B, lstate);

lstate = PTrace(lstate, [4:7]);

#QFT
H1=ProductGate(3, H, [1]);
lstate = Evolve(H1, lstate);

CPh1=ControlledGate(3, Phase(0,pi/2),1 ,2);
lstate = Evolve(CPh1, lstate);

H2=ProductGate(3, H, [2]);
lstate = Evolve(H2, lstate);

CPh2=ControlledGate(3, Phase(0,pi/4),1 ,3);
lstate = Evolve(CPh2, lstate);

CPh3=ControlledGate(3, Phase(0,pi/2),2 ,3);
lstate = Evolve(CPh3, lstate);

H2=ProductGate(3, H, [3]);
lstate = Evolve(H2, lstate);

ret=lstate;

endfunction