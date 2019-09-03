# Exercise 1


In order to compile an optimized version of QE you need:

* a library for linear algebra
* a library for FFT
* (possibly) a parallel eigenvalue solver
* (possibly) an optimized compiler

Let's find these stuff in the system you have here.

Extract the relevant information from your module environment using:

    module av
    
to find the compilers, the libraries, etc.

You should an output similar to this:

    $ module av
    ------------ /some/path/modulefiles/profiles ------------ 
    profile/advanced      profile/candidate     profile/lifesc        
    profile/archive       profile/chem          profile/phys          
    profile/astro         profile/deeplrn       profile/pyhs          
    profile/base(default) profile/eng           profile/statistics    
    profile/bioinf        profile/global        profile/visual        
    ------------ /some/path/opt/modulefiles/base/environment ------------ 
    autoload 
    ------------ /some/path/opt/modulefiles/base/libraries ------------ 
    blas/3.8.0--intel--pe-xe-2018--binary    
    boost/1.58--intelmpi--2018--binary       
    boost/1.61.0--intelmpi--2018--binary     
    cubelib/4.4--intelmpi--2018--binary      
    fftw/3.3.8--intelmpi--2018--binary       
    gsl/2.2.1--gnu--6.1.0                    
    hdf5/1.8.17--intelmpi--2018--binary      
    hdf5/1.8.18--intel--pe-xe-2018--binary   
    lapack/3.8.0--intel--pe-xe-2018--binary  
    libjpeg-turbo/1.3.1                      
    magma/2.3.0--cuda--9.0                   
    metis/5.1.0--intel--pe-xe-2018--binary   
    mkl/2018--binary                         
    mpi4py/3.0.0--intelmpi--2018--binary     
    mpi4py/3.0.0--python--3.6.4              
    netcdf/4.6.1--intel--pe-xe-2018--binary  
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

