
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 4 February 2004

function PlotAmps(varargin)
#TODO need checking if ket is valid


#first argument is allways ket
#if we have only one parameter then we draw real part
if (nargin==1)
	temp = va_arg();
	if(!isvector(temp))
		error("Argument should be ket vector");
	else
		plot([0:length(temp)-1],real(temp),"^");
	endif
elseif (nargin==2)
	temp = va_arg();
	if(!isvector(temp))
		error("Argument should be ket vector");
	else
		ReIm = va_arg();
		if(ReIm=="Re")
			plot([0:length(temp)-1],real(temp),"^;Real;");
		elseif(ReIm=="Im")
			plot([0:length(temp)-1],imag(temp),"^;Imag;");
		elseif(ReIm=="RI")
			plot([0:length(temp)-1],real(temp),"^;Real;", [0:length(temp)-1],imag(temp),"^;Imag;");
		else
			error("wrong second argument");
		endif
	endif

else
	error("PlotAmps takes one or two arguments");
endif

endfunction

