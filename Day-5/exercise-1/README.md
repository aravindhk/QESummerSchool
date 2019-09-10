# Exercise 1


In order to compile an optimized version of QE you need:

* a library for linear algebra
* a library for FFT
* (possibly) a parallel eigenvalue solver
* (possibly) an optimized compiler

Let's find these requirements in the system at your disposal.

The configuration of the IJS cluster requires, as a first step, to move to a
compute node. This can be done for example with:

    ssh fp001

Information about the module environment can be obtained using:

    module av

This will allow you to find the compilers, the libraries, etc.

You should obtain an output similar to this one:

    $ module av
    
    --------------------------------------------------------------------------------------------------- /cvmfs/sling.si/modules/el7/modules/all ---------------------------------------------------------------------------------------------------
       Autoconf/2.69-GCCcore-5.4.0             FFTW/3.3.7-gompi-2018a                                 OpenMPI/3.1.1-gcccuda-2018b                        flex/2.6.0                             libtool/2.4.6-GCCcore-6.4.0
       Autoconf/2.69-GCCcore-6.4.0             FFTW/3.3.8-gompi-2018b                      (D)        OpenMPI/3.1.3-PGI-19.4                             flex/2.6.3                             libtool/2.4.6-GCCcore-7.3.0
       Autoconf/2.69-GCCcore-7.3.0             GCC/4.8.5                                              OpenMPI/4.0.0-GCC-8.2.0-2.31.1              (D)    flex/2.6.4-GCCcore-6.4.0               libtool/2.4.6-GCCcore-8.2.0      (D)
    [...]
    

The command

    module load xxx

can be used to prepare the environment (replace xxx with the appropriate module names).
We will target a conventional Intel based platform in this tutorial.

In general one would proceed as follows:

1. load Intel compilers, if not available, look for GNU compilers,
2. load Intel's MPI, if not available, look for OpenMPI,
2. load the MKL library, if not available, look for OpenBLAS, ESSL or GoToBlas.

The command

    module show xxx

can be used to check how each module modified the environment by adding
binaries to the `PATH` or by adding additional environment variables.
This is also a good way to verify where the applications and the
libraries actually reside.

The aim of this first, very short exercise is to identify the best options
you have on this cluster. Can you list the module you will need to load *before*
running the `configure` command of QE?

Here we will use openmpi from this module
     
    $ module load mpi/openmpi-x86_64

that provides the most recent version of OpenMPI and wraps gfortran v9.1.

You should also load the MKL module with the command:

    $ module load MKL/mkl_2019.4.243
