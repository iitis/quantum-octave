clear ind;
clear MAX;
cnot = CNot(2, [1], [2])
msg = State(Normalize(Ket([0]) + Ket([1])))
MAX = 100;

#prmx = uniform_rnd (0, .3, 1, MAX);
#prmy = uniform_rnd (0, .3, 1, MAX);

prm1 = sort(uniform_rnd (0, .1, 1, MAX));
prm2 = sort(uniform_rnd (0, .2, 1, MAX));
prm3 = sort(uniform_rnd (0, .3, 1, MAX));
prm4 = sort(uniform_rnd (0, .5, 1, MAX));

for k=1:MAX	
	tmp1 = ErrorXYZ ( prm1(k), 0 , prm1(k) );
	tmp2 = ErrorXYZ ( prm2(k), 0 , prm2(k) );
	tmp3 = ErrorXYZ ( prm3(k), 0 , prm3(k) );
	tmp4 = ErrorXYZ ( prm4(k), 0 , prm3(k) );

	error(k).mtx1 =  kron( kron ( tmp1, tmp1 ), kron ( tmp1, tmp1 ));
	error(k).mtx2 =  kron( kron ( tmp2, tmp3 ), kron ( tmp2, tmp2 ));
	error(k).mtx3 =  kron( kron ( tmp3, tmp3 ), kron ( tmp3, tmp3 ));
	error(k).mtx4 =  kron( kron ( tmp4, tmp4 ), kron ( tmp4, tmp4 ));

	tgq(k).mtx1 = Evolve( error(k).mtx1 , TagQubit ( msg, cnot ) );
	tgq(k).mtx2 = Evolve( error(k).mtx2 , TagQubit ( msg, cnot ) );
	tgq(k).mtx3 = Evolve( error(k).mtx3 , TagQubit ( msg, cnot ) );
	tgq(k).mtx4 = Evolve( error(k).mtx4 , TagQubit ( msg, cnot ) );

	out(k).mtx1 = PTrace ( CheckTag ( tgq(k).mtx1, cnot ), [1,2,4]);
	out(k).mtx2 = PTrace ( CheckTag ( tgq(k).mtx2, cnot ), [1,2,4]);
	out(k).mtx3 = PTrace ( CheckTag ( tgq(k).mtx3, cnot ), [1,2,4]);
	out(k).mtx4 = PTrace ( CheckTag ( tgq(k).mtx4, cnot ), [1,2,4]);

	fid_error1(k) = Fidelity ( msg, out(k).mtx1 );
	fid_error2(k) = Fidelity ( msg, out(k).mtx2 );
	fid_error3(k) = Fidelity ( msg, out(k).mtx3 );
	fid_error4(k) = Fidelity ( msg, out(k).mtx3 );
endfor

printf("Ploting results...\n");
gset terminal postscript eps 22
#gset output "fide-mtx-error-3D.eps"
#gset zlabel "Fidelity"
#gset xlabel "e dla ErrorY"
#gset ylabel "e dla ErrorY"

ind = 1:MAX;

#mesh(ind, ind, real(fid_error));

#gset xlabel "e dla ErrorX"
#gset output "fide-mtx-errorx.eps"
#plot (prmx(ind),real(fid_error(ind)),"x;Fidelity;");

gset xlabel "e dla macierzy bledu"
gset output "fide-mtx-error.eps"
plot (prm1(ind), fid_error1(ind),"x;blad w [0,.1];",
	prm2(ind), fid_error2(ind),";blad w [0,.2];",
	prm3(ind), fid_error3(ind),"+;blad w [0,.3];",
	prm4(ind), fid_error4(ind),";blad w [0,.5];");
#plot (prm, fid_error,"^;Fidelity;");

printf("Finished...\n");
