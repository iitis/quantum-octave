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

DEFUN_DLD (H, args, ,
		"Function @code{H} returns 2x2 Hadamard matrix")
{
	if (args.length() > 0) {
		usage ("KetN ()");
		error ("Wrong number of arguments!");
	} else {
		Matrix hm(2,2);

		hm(0,0) = 1/sqrt(2);
		hm(0,1) = 1/sqrt(2);
		hm(1,0) = 1/sqrt(2);
		hm(1,1) = -1/sqrt(2);
		
		return octave_value (hm);
	}
}
