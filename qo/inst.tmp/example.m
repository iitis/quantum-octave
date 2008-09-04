reg1=newregister(4);
reg2=newregister(2);

# state=evolve(productgate(sx,reg1(1:2)),state);
evolve(productgate(sx,reg1(1:2)));
evolve(qif(qrgr(reg1,2),{h,reg2(2)},{sx,reg2(1)}));
clearregister(reg2);
registersetto(reg1,3);
registersetto(reg1,[0,1,2,3]);
a=collapse(reg1);

for i=[1:10]
	evolve(qif(qreq(reg1,i),{h,reg2(i)},{id,reg2(1)}));