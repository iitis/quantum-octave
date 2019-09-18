# General info

```QuantumOctave``` is a set of GNU Octave functions for doing simulations of quantum computers (ie. finite-dimensional quantum systems).  It provides means to operate on registers, build complex quantum gates and perform calculations with mixed states. Most functions utilize only basic algebraic operation and should work with Matlab® as well.

**Note** This package is not mainteined anymore.

# Installation

To use quantum-octave you need [GNU Octave](http://www.octave.org/) or [MathWorks Matlab](https://www.mathworks.com/products/matlab.html).


Package was tested with GNU Ocatve versions 3.1 and some function may not work with older version of GNU Octave.

Package source code can be downloaded from Github

```
git clone git@github.com:ZKSI/quantum-octave.git
```

In GNU Octave use ```addpath``` to use the package

```
addpath <download-dir>/quantum-octave/src
```

Alternatively you can start Octave in the ```<download-dir>/quantum-octave``` directory where ```.octaverc``` file is located.

# Documentation

Most of the quantum-octave functions are documented within source files. In particular, you should find this package useful if you are interested in

  * construction of quantum states,
  * construction of the quantum circuit,
  * testing properties of states and matrices,
  * analysis of entanglement,
  * operations including partial transposition and partial trace.
