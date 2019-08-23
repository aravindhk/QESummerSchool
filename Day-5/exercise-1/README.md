# Exercise 1


In order to compile an optimized version of QE you need:

* a library for linear algebra
* a library for FFT
* (possibly) a parallel eigenvalue solver
* (possibly) an optimized compiler

Let's find these stuff in the system you have here.

Extract the relevant information from your module environment.
Use

    module av
    
to find the compilers, the libraries, etc.

You should see this output:


Now proceed with 

    module load xxx

to prepare the environment. We will target a conventional Intel based platform in this tutorial.

1. Load Intel compilers v.xxx.
2. load Intel's MPI,
2. load the MKL library v.yyy

The command

    module show xxx

can be used to check how each module modified the environment by adding binaries to the `PATH` or by adding additional environment variables. This is also a good check to verify where the applications and the libraries actually reside.

Remember that Intel's MPI wrappers have different names. You can finally check that these commands are now in the `PATH`:

    mpiifort
    mpiicpc
    mpiicc
 


