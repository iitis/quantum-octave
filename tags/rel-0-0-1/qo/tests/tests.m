#x = ket([0,1,1]')

a = Ket([0,1,0,1]')
b = Ket([1,0]')

#Not(x,[1,2])


ProductGate(a,[0,1;1,0],[1,2])
ProductGate(a,1/sqrt(2)*[1,1;1,-1],[1,2,4])
a = [1,2,3]';

if (isvector(a))
printf ("vector");
endif

printf("Ala ma kota Shrodingera");
