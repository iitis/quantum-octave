/* File: BuildBinaryVector.cc
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
 * Last modyfication: 10 April 2004  
 */

#include <octave/oct.h>
#include <cmath>
#include <iostream>
using namespace std;

DEFUN_DLD (BuildBinaryVector, args, ,
				"The `BuildBinaryVector' function is loadable function implemented in C++.\n"
	  			"Function `BuildBinaryVector(list,binvec,binnum,qubits)' returns\n"
	  			"binary vector in `qubits'-qubit Hilbert space labeled with number constructed\n"
				"as follows. Every bit of this number which is listed in list is set according with\n"
				"`binvec', other bits are complemented using `binnum'."
				)
{
	// test for number of arguments
	if (args.length() != 4) {
		usage ("BuildBinaryVector (list,binvec,binnum,qubits)");
		error ("Wrong number of arguments!\n");
	} else {
		// get the values of arguments
		RowVector list (args(0).vector_value());
		RowVector sub (args(1).vector_value());
		RowVector num (args(2).vector_value());
		int  qubits = args(3).int_value();	// number of qubits
		
		// get sizes of lists
		int ls = list.length();
		int ss = sub.length();
		int ns = num.length();
		
		// tests for sizes of lists	
		if ( ss != ls )
			error ("Error in substitution list!\n");
		if ( ss+ns != qubits )
			error ("Dimensions does't match!\n");	
	
		// set counters
		int is = 0;
		int in = 0;
	
		// initialize returned vector
		RowVector bv(qubits);
	
		for (int i=0;i<qubits;i++) {
			if (is < ss && list(is) == i+1) {
				bv(i) = sub(is);
				is++;
			} else if (in < ns ) {
				bv(i) = num(in);
				in++;
			} else
				bv(i) = sizeof(num);
		}
		
		return octave_value (bv);
	}	
}
