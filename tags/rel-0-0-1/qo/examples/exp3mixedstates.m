function ret = exp3mixedstates(steps)

# prepare mixed state

ps = State(KetN(0,3));
mm = Id(3);

out = list();

for i =0:steps
	i
	p=i/steps
	ms = ((1-p)*ps + p*mm) / trace((1-p)*ps + p*mm);
	czy1 = trace(ms)
	#o = Shor15(ms);
	
	out = append(out, ms);
endfor

ret = out;

endfunction
