/* File: Dec2BinVec.cc
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

DEFUN_DLD (Dec2BinVec, args, ,
		  "The `Dec2BinVec' function implemented in C++."
		  "For given `num' and `dim' function `Dec2BinVec(num,dim)'"
		  "returns binary representation of `num' on `dim' bits."
		  )
{
	if (args.length() != 2) {
		usage ("Dec2BinVec (number, dim)");
		error ("Wrong number of arguments!");
	} else {
		int num = args(0).int_value();
		int qub = args(1).int_value();
		// size of returned vector 
		double ves = pow(2.0,(double)qub);
		if ( num >= ves ) {
			error("Number to big to fit!");			
		} else {
			RowVector bv(qub);
	
			for (int i=0; i<qub; i++)
				bv(i) = 0;
			for (int i=0; i<qub; i++) {
				int temp = (int)pow(2.0,(double)i);
				if ((temp & num) == temp) bv(qub-1-i) = 1;
			}
		return octave_value (bv);
		}
	}
}
