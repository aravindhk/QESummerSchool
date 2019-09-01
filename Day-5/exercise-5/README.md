# Exercise 6

The accelerated version of QE is based on CUDA Fortran. This extension of the Fortran programming language is fully implemented only by the PGI Compilers.
These are available on most clusters and can be freely downloaded from the PGI website.

## Preparing the environment

The accelerated version of QE requires PGI compilers and a series of libraries. Let's check everything that is needed.

* check that mpif90 points to pgf90. To this aim, `mpif90 --version` will do.
* check that the cuda toolkit available.


The GPU version also strongly benefits from MKL libraries so, if possible, on Intel machines, use them.

## Downloading

You can obtain the last version of the code here: gitlab.com/QEF/q-e-gpu.

In this tutorial we will use the development version since it includes some
important updates required to correctly configure the code against the
latest PGI compilers' release.

You can get it with:

    # Run it!
    wget https://gitlab.com/QEF/q-e-gpu/-/archive/gpu-develop/q-e-gpu-gpu-develop.tar.gz


## Configuring QE

A few important notes about the accelerated version of the code:

1. QE-GPU *requires* OpenMP.
2. You will have to specify where the CUDA Runtime is installed and its version and, in addition, the compute capabilities of the card that you plan to use. **Cards with different compute capabilities from the one specified at compile time will not execute the code correctly**. In addition you may run into wired error, be warned!
3. You will have to disable the parallel eigenvalue solver. 

This translates to this configure line:

    ./configure --with-cuda=XX --with-cuda-runtime=Y.y --with-cuda-cc=ZZ --enable-openmp --with-scalapack=no 

where `XX` is the location of the CUDA Toolkit (in HPC environments it is
generally $CUDA_HOME), `Y.y` is the version of the CUDA Toolkit (`Y` and `y` are the two numbers identifying major and minor release, e.g. 9.0)  and `ZZ` is the compute capability of the card.

**Question:** what is the correct configuration command for the K40 and the V100?

Note that a helper script is also available in the `dev-tools` directory and can be used like this: `python get_device_props.py` but you must run it on the target compute node.

Once the configure script finishes, you should get something like this:

    setting DFLAGS... -D__CUDA -D__PGI -D__DFTI -D__MPI
    setting IFLAGS... -I$(TOPDIR)/include -I$(TOPDIR)/FoX/finclude -I$(TOPDIR)/S3DE/iotk/include/ -I/home/griduser0002/intel/mkl/include
    configure: creating ./config.status
    config.status: creating install/make_lapack.inc
    config.status: creating include/configure.h
    config.status: creating make.inc
    config.status: creating configure.msg
    config.status: creating install/make_wannier90.inc
    config.status: creating include/c_defs.h
    --------------------------------------------------------------------
    ESPRESSO can take advantage of several optimized numerical libraries
    (essl, fftw, mkl...).  This configure script attempts to find them,
    but may fail if they have been installed in non-standard locations.
    If a required library is not found, the local copy will be compiled.
    
    The following libraries have been found:
      BLAS_LIBS=-L/a/path/to/mkl/lib/intel64_lin -lmkl_intel_lp64  -lmkl_core -lmkl_intel_thread
      LAPACK_LIBS=
      FFT_LIBS=
      
      
    
    Please check if this is what you expect.
    
    If any libraries are missing, you may specify a list of directories
    to search and retry, as follows:
      ./configure LIBDIRS="list of directories, separated by spaces"
    
    Parallel environment detected successfully.\
    Configured for compilation of parallel executables.
    
    For more info, read the ESPRESSO User's Guide (Doc/users-guide.tex).
    --------------------------------------------------------------------
    configure: success




## Compilation

Only the `pw.x` is available for the time being. You compile it in the usual way:

    # Run me!
    make -j pw
