#include <octave/oct.h>
#include <math.h>

DEFUN_DLD (KetN, args, ,
		  "The `KetN' function implemented in C++. Ket(num,qub) returns\n"
		  "base vector labeles by number `num' in `2^qub'-dimensional\n"
		  "Hilbert space." )
{
	int num = args(0).int_value();
	int qub = args(1).int_value();
	
	// size of returned qubit
	double ves = pow(2.0,(double)qub);

	if ( num >= ves ) {
		error("Number to big to fit!");			
		return octave_value (0);
	} else {
		ColumnVector ket( (int)ves );
		
		for (int i=0; i<ves; i++)
			ket(i) = 0;

		// =1 only only on one position
		
		ket(num) = 1;
		return octave_value (ket);
	}
}
