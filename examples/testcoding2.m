function testcoding2(code, er1, er2, er3)

v = Normalize(2*Ket([0])+Ket([1]));
s = State(v)

#ps = GetPureState(s)

ss = kron(s,State(KetN(0,2)))

#pss = GetPureState(ss)

en = Encode(s, code)

en1 = Evolve(ProductGate(3,er1,[1]),en)
en2 = Evolve(ProductGate(3,er2,[2]),en)
en3 = Evolve(ProductGate(3,er3,[3]),en)

d1 = Decode(en1,code)
d2 = Decode(en2,code)
d3 = Decode(en3,code)
d0 = Decode(en,code)

#dps1 = GetPureState(d1)
#dps2 = GetPureState(d2)
#dps3 = GetPureState(d3)
#dps0 = GetPureState(d0)


r1 = Recover(d1,code)
r2 = Recover(d2,code)
r3 = Recover(d3,code)
r0 = Recover(d0,code)


#o1 = PTrace(d1,[2:3])
#o2 = PTrace(d2,[2:3])
#o3 = PTrace(d3,[2:3])

#oss = PTrace(ss,[2:3])

#p1 = GetPureState(r1)
#p2 = GetPureState(r2)
#p3 = GetPureState(r3)


#d1-ss
#d2-ss
#d3-ss

endfunction
