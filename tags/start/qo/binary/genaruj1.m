msg = State(Normalize(Ket([0]) + Ket([1])))
s0 = State(kron(Id,H)*Ket([0,1]))
cnot = CNot(2, [1], [2])
printf("Starting calculations...\n");
 for k=1:200 gate(k).mtx = ControlledGate (2, RotY(2*k*pi/200), [2], [1]); endfor
 for k=1:200 key(k).mtx = Evolve(gate(k).mtx,s0); endfor
 for k=1:200 entr_key(k) = Entropy( PTrace(key(k).mtx, [2]) ); endfor
 for k=1:200 neg_key(k) = Negativity( key(k).mtx, [2] ); endfor
 for k=1:200 logneg_key(k) = LogNegativity( key(k).mtx, [2] ); endfor

 for k=1:200 out(k).mtx = PTrace(CheckTag(TagQubitWithKey(msg,cnot, key(k).mtx),cnot),[1,2,4]); endfor
 for k=1:200 fid_key(k) = Fidelity(msg,out(k).mtx); endfor

 printf("Ploting results...\n");
gset ylabel "Fidelity uwiezytelniania"
gset terminal postscript eps 22
ind = 1:200;

#gset xlabel "Ujemnosc klucza"
#gset output "fide-key-neg.eps"
#plot(neg_key (ind), fid_key(ind) ,"o;Fidelity;")

gset xlabel "Entropia zredukowana klucza"
gset output "fide-key-entr.eps"
plot(entr_key (ind), fid_key(ind) ,"o;Fidelity;")

#gset xlabel "Ujemnosc logarytmiczna klucza"
#gset output "fide-key-logneg.eps"
#plot(logneg_key (ind), fid_key(ind) ,"o;Fidelity;")

#gset xlabel "Przesuniecie fazy w bramce"
#gset ylabel "Fidelity i ujemnosc logarytmiczna"
#gset output "fide-key-dwa.eps"
#plot(ind, fid_key(ind) ,"+;Fidelity;",ind, logneg_key (ind),"x;LogNegativ;")

printf("Finished...\n");
