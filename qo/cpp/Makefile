#######################################################
# This file is a part of quantum-octave package. 
#
# Author: Jarek Miszczak
# Created: 10 April 2004
#######################################################

SELL = /bin/sh

# change this variable if you are using non-standard version of octave
# for example:
# TOOL = /usr/local/octave-2.1.57/bin/mkoctfile
TOOL = mkoctfile

# see: man mkoctfile
FLAGS = -s

.SUFFIXES = .cc .oct

OBJ = BuildBinaryVector.oct KetN.oct Dec2BinVec.oct H.oct

all: BuildBinaryVector KetN Dec2BinVec H
	
BuildBinaryVector:
	$(TOOL) $(FLAGS) BuildBinaryVector.cc

KetN:
	$(TOOL) $(FLAGS) KetN.cc

Dec2BinVec:
	$(TOOL) $(FLAGS) Dec2BinVec.cc

H:
	$(TOOL) $(FLAGS) H.cc
	
clean:
	rm -f $(OBJ)
	rm -f *.o
	rm -f *~
