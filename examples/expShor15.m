function ret = expShor15(steps)

# prepare mixed state

ps = State(KetN(0,7));
mm = Id(7);

out = list();

for i =0:steps
	i
	p=i/steps
	ms = ((1-p)*ps + p*mm) / trace((1-p)*ps + p*mm);
	czy1 = trace(ms)
	o = Shor15(ms);
	out = append(out, o);
endfor

ret = out;

endfunction