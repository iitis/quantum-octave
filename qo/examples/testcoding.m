function testcoding(code)

s = State(Normalize(2*2*Ket([0])+Ket([1])))
ss = kron(s,State(KetN(0,2)))
en = Encode(s, code)

en1 = Evolve(ProductGate(3,Not,[1]), en)
en2 = Evolve(ProductGate(3,Not,[2]), en)
en3 = Evolve(ProductGate(3,Not,[3]), en)

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

d1-ss
d2-ss
d3-ss

endfunction
