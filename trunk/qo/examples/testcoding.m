function testcoding(code, error)

v = Normalize(2*2*Ket([0])+Ket([1]));
s = State(v)
ss = kron(s,State(KetN(0,2)))

pss = GetPureState(ss)

en = Encode(s, code)

en1 = Evolve(ProductGate(3,RotX(error),[1]), en)
en2 = Evolve(ProductGate(3,RotX(error),[2]), en)
en3 = Evolve(ProductGate(3,RotX(error),[3]), en)

r1 = Recover(en1,code)
r2 = Recover(en2,code)
r3 = Recover(en3,code)

d1 = Decode(r1,code)
d2 = Decode(r2,code)
d3 = Decode(r3,code)

o1 = PTrace(d1,[2:3])
o2 = PTrace(d2,[2:3])
o3 = PTrace(d3,[2:3])

oss = PTrace(ss,[2:3])

p1 = GetPureState(d1)
p2 = GetPureState(d2)
p3 = GetPureState(d3)


#d1-ss
#d2-ss
#d3-ss

endfunction
