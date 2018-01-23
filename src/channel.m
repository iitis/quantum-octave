# /* Kraus operators for well known quanum channels */
# /* ref: Nielsen Chuang "Quantum Information and Compuation", Cambridge Press 2000, p. 397 */ 

function ret=channel(name,p)
	if (nargin!=2)
		usage("channel(name,p)");
	endif

	if(strcmpi(name,"depolarizing")||strcmpi(name,"d"))
		ret{1}=sqrt(1-(3*p/4))*id;
		ret{2}=sqrt(p/4)*sx;
		ret{3}=sqrt(p/4)*sy;
		ret{4}=sqrt(p/4)*sz;
	elseif(strcmp(name,"amplitudedamping")||strcmp(name,"ad"))
		ret{1}=[1,0;0,sqrt(1-p)];
		ret{2}=[0,sqrt(p);0,0];
	elseif(strcmp(name,"phasedamping")||strcmp(name,"pd"))
		ret{1}=[1,0;0,sqrt(1-p)];
		ret{2}=[0,0;0,sqrt(p)];
	elseif(strcmp(name,"bitflip")||strcmp(name,"bf"))
		ret{1}=sqrt(1-p)*id;
		ret{2}=sqrt(p)*sx;
	elseif(strcmp(name,"phaseflip")||strcmp(name,"pf"))
		ret{1}=sqrt(1-p)*id;
		ret{2}=sqrt(p)*sz;
	elseif(strcmp(name,"bitphaseflip")||strcmp(name,"bpf"))
		ret{1}=sqrt(1-p)*id;
		ret{2}=sqrt(p)*sy;
	else
		error("channel: channel name not known");
	endif
endfunction