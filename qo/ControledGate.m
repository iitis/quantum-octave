#_Not = [0,1;1,0];
#_H = 1/sqrt(2)*[1,1;1,-1];

function ret = ControledGate(invek,gate,contrv,targetv)

proj1 = [0,0;0,1];


sort(contrv);
sort(targetv);

flags = zeros(1,log2(length(invek)));

for i = 1:length(contrv)
	ctmp = contrv(i);
	flags(ctmp) = 1; 
endfor

for i = 1:length(targetv)
	ttmp = targetv(i);
	if flags(ttmp) != 0 
		printf("Error: arguments overlaping\n");
		return;
	else		
	flags(ttmp) = 2; 
	endif
endfor

# initialization

ret = Id(length(invek));

if (flags(1) == 1)
	tmp = proj1;
elseif (flags(1) == 2)
	tmp = Id(1) - gate;
elseif (flags(1) == 0)
	tmp = Id(1);
else
	printf("Error: unknown error occured\n");
endif	

# matrix building

for i = 2:log2(length(invek))
if (flags(i) == 1)
	tmp = kron(tmp,proj1);
elseif (flags(i) == 2)
	tmp = kron(tmp,Id(1) - gate);
elseif (flags(i) == 0)
	tmp = kron(tmp,Id(1));
else
	printf("Error: unknown error occured\n");
endif
endfor

tmp = Id(log2(length(invek))) - tmp

ret = tmp*invek;	

endfunction
