function ret = testBFuncToCirc(aa)
	ket = KetN(aa,4);
	sx=2;
	sy=2;
	f=[3,1,2,2];
	
	ketT1 = Kron(KetN(aa,sx),KetN(f(aa+1),sy));
	ketT2 = Kron(KetN(f(aa+1),sy),KetN(aa,sx));
	
	lista = BFuncToCirc(sx,sy,f);
	a=lista{1};
	for i=2:size(lista)(2)
		a=Circuit(a,lista{2});
	endfor
	a
	ket=a*ket;
odp(1,:) = ket';
odp(2,:) = ketT1'	;
odp(3,:) = ketT2'	;
odp
endfunction