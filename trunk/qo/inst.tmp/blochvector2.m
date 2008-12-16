function ret=blochvector2(theta,phi)
#	cos[\[Theta]]*Ket[0,2]+Exp[I \[Phi]]*Sin[\[Theta]]*Ket[1,2];
	ret=cos(theta)*ket([0])+exp(i*phi)*sin(theta)*ket([1]);
endfunction
