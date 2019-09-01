# Exercise 2

We will now compile an optimized version of QE.

Let's first see what happens when you forget to prepare the environment correctly.
Clean up everything you did till now with the command

    # Run me!
    module purge

Now download the last QE release and run the `configure` command. 
Copy and paste the following instructions on your terminal:

    # Run me!
    wget https://gitlab.com/QEF/q-e/-/archive/qe-6.4.1/q-e-qe-6.4.1.tar.bz2
    tar xjf q-e-qe-6.4.1.tar.bz2
    cd q-e-qe
    ./configure




The final message should look like this:

     1	setting DFLAGS... -D__FFTW
     2	setting IFLAGS... -I$(TOPDIR)/include -I$(TOPDIR)/FoX/finclude -I$(TOPDIR)/S3DE/iotk/include/
     3	configure: creating ./config.status
     4	config.status: creating install/make_lapack.inc
     5	config.status: creating include/configure.h
     6	config.status: creating make.inc
     7	config.status: creating configure.msg
     8	config.status: creating install/make_wannier90.inc
     9	config.status: creating include/c_defs.h
    10	--------------------------------------------------------------------
    11	ESPRESSO can take advantage of several optimized numerical libraries
    12	(essl, fftw, mkl...).  This configure script attempts to find them,
    13	but may fail if they have been installed in non-standard locations.
    14	If a required library is not found, the local copy will be compiled.
       
    15	The following libraries have been found:
    16	  BLAS_LIBS=
    17	  LAPACK_LIBS=$(TOPDIR)/LAPACK/liblapack.a $(TOPDIR)/LAPACK/libblas.a
    18	  FFT_LIBS=
    19	  
    20	  
    21	Please check if this is what you expect.


The current configuration will probably allow you to compile QE without problems, 
but this version will give you wired results when running on a multicore cluster.

> **Question**: can you spot all the problems here❓ [Answer](#A1)

---

Now let's go back and reload all modules.

    # Run me!
    module load xxx

This time we configure the optimal executable straight away with the following configuration string:

    # Run me!
    ./configure --enable-openmp --with-scalapack=yes

Let's review what these options are:

1. `--enable-openmp` will enable the low lying parallel layer based on OpenMP directives.
2. `--with-scalapack=yes` this option will activate distributed linear algebra and especially the parallel eigenvalue solver. NB: when using Intel's compilers, this should instead be set to `--with-scalapack=yes`.

After configure script completes inspect the final log and check that:

> **Question**: What tells you that everything is fine this time❓ [Answer](#A2)

---

In order to squeeze as much performance as possible, the final suggestion is to exploit the ELPA library. You can do this with the following configuration command:
 
 
    # Run me!
    export ELPAROOT=/PATH/TO/ELPA...
    ./configure --enable-openmp --with-scalapack=intel  --with-elpa=${ELPAROOT} \
     --with-elpa-include="-I${ELPAROOT}/include/elpa/modules" \
     --with-elpa-lib=${ELPAROOT}/lib/libelpa.a \

where ELPA library has already been compiled for you and installed under `ELPAROOT`.

Finally, compile everything with:

    # Run me!
    make -j pw

and check that the `pw.x` executable is present in the `bin` directory.

---

---

<a name="A1"></a> **Answer 1**: this log actually tells us **many** things:

*  as mentioned in the last line, you should really check this output! 😉
* Line 1: there are at least two problems here.
    1. The flag `-D__MPI'` is missing, meaning that a serial executable will be compiled.
    2. The flag `-D__FFTW'` means that the internal (old) copy of the  FFTW library will be used. This is generally far from optimal

---

<a name="A2"></a> **Answer 2**:

You should have this output:

     1	setting DFLAGS... -D__DFTI -D__MPI -D__SCALAPACK
     2	setting IFLAGS... -I$(TOPDIR)/include -I$(TOPDIR)/FoX/finclude -I$(TOPDIR)/S3DE/iotk/include/ -I/cineca/prod/opt/compilers/intel/pe-xe-2018/binary/mkl/include
     3	configure: creating ./config.status
     4	config.status: creating install/make_lapack.inc
     5	config.status: creating include/configure.h
     6	config.status: creating make.inc
     7	config.status: creating configure.msg
     8	config.status: creating install/make_wannier90.inc
     9	config.status: creating include/c_defs.h
    10	--------------------------------------------------------------------
    11	ESPRESSO can take advantage of several optimized numerical libraries
    12	(essl, fftw, mkl...).  This configure script attempts to find them,
    13	but may fail if they have been installed in non-standard locations.
    14	If a required library is not found, the local copy will be compiled.
       
    15	The following libraries have been found:
    16	  BLAS_LIBS=  -lmkl_intel_lp64  -lmkl_intel_thread -lmkl_core
    17	  LAPACK_LIBS=
    18	  SCALAPACK_LIBS=-lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64
    19	  FFT_LIBS=
    20	  
    21	  
    22	Please check if this is what you expect.

1. A parallel executable will be compiled (this is confirmed by the `__MPI` flag)
2. Intel's FFT driver will be used (this is confirmed by the `__DFTI` flag)
3. Parallel distributed linear is enabled ( `-D__SCALAPACK` and the value of `SCALAPACK_LIBS`)



