/* File: KetN.cc
* This file is part of quantum-octave package. For copyright term see LICENSE file
* in package main direcrory.
*
* This is implementation in C++ of function which can be found
* in package main directory.
*
* You can finde more information on web page http://quantum-octave.sourceforge.net/
*
* Author: Jarek Miszczak
* Created: 5 April 2004
* Last modyfication: 6 May 2004
*/
			
#include <octave/oct.h>
#include <math.h>

DEFUN_DLD (KetN, args, ,
		  "The `KetN' function implemented in C++. KetN(num,qub) returns\n"
		  "base vector labeled by number `num' in `2^qub'-dimensional\n"
		  "complex Hilbert space." )
{
	if (args.length() != 2) {
		usage ("KetN (num, qub)");
		error ("Wrong number of arguments!");
	} else {
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
}
