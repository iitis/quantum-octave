gset ylabel "Fidelity uwiezytelniania"
gset terminal postscript eps 22
ind = 1:200;

gset xlabel "Ujemnosc klucza"
gset output "fide-key-neg.eps"
plot(neg_key (ind), fid_key(ind) ,"o;F(s0,out) = f ( N(key) );")

gset xlabel "Entropia zredukowana klucza"
gset output "fide-key-entr.eps"
plot(entr_key (ind), fid_key(ind) ,"o;F(s0,out) = f ( EvN(key) );")

gset xlabel "Ujemnosc logarytmiczna klucza"
gset output "fide-key-logneg.eps"
plot(logneg_key (ind), fid_key(ind) ,"o;F(s0,out) = f ( LogN(key) );")

printf("Finished...\n");
