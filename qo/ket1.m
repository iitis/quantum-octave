#x = ket([0,1,1]')

a = ket([0,1,0,1]')
b = ket([1,0]')

#Not(x,[1,2])


ProductGate(a,[0,1;1,0],[1,2])
ProductGate(a,1/sqrt(2)*[1,1;1,-1],[1,2,4])
