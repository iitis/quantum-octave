function ret = dec2basevec(N, B, LEN)
	if (nargin>3)
		usage('dec2basevec(N, B, LEN)');
	endif

	str=dec2base(N, B, LEN);
	ret=zeros(1,length(str));
	for i=[1:length(str)]
		ret(i)=str2num(str(i));
	endfor
end




