function ret=TeleportErrorFree(state, code, er)

if (nargin!=3)
	usage("TeleportErrorFree(state, code, er)");
endif

#encode state
en = Encode(state, code)

#teleport state
e1 = PTrace(en,[2,3])
e2 = PTrace(en,[1,3])
e3 = PTrace(en,[1,2])

#e1
#e1 = TeleportWError(e1,er,[2])
#e2 = TeleportWError(e2,Id,[2]);
#e3 = TeleportWError(e3,Id,[2]);

#decode state
t = Kron(e1,e2,e3)


d = Decode(t,code);

#recover state
r = Recover(d,code);

ret = r;

endfunction
