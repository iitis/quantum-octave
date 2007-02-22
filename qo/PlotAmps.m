## -*- texinfo -*-
## @deftypefn {Function file} {} PlotAmps(@var{ket},@var{type})
## Function @code{PlotAmps} plots amplitude of @var{ket} vector 
## in standard base. Second argument describes which part of 
## amplitude is plotted. "Re" - only real part, "Im" - only 
## imaginary part, "RI" - real and imaginary part with diffrent 
## colors. If the second is ommited it is assumed to be "Re".
##
## Example:
## @example 
##  @group
## PlotAmps(Ket([1,1,0]))
## PlotAmps(Ket([1,0])+Ket([0,1]),"Im")
## PlotAmps(Ket([1,0])+i*Ket([0,1]),"RI")
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {PlotProbs, Measure}
##

function PlotAmps(varargin)

# TODO need checking if ket is valid
# first argument is allways ket
# if we have only one parameter then we draw real part

if (nargin==1)
	temp = va_arg();
	if(!isvector(temp))
		error("Argument should be ket vector");
	else
		plot([0:length(temp)-1],real(temp),"^;Amplitudes;");
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

