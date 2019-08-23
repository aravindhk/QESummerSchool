# Exercise 6

The accelerated version of QE requires the PGI Compilers.
These are available on most clusters and can be freely downloaded from the PGI website.

## Preparing the environment

The accelerated version of QE requires PGI compilers and a series of libraries. Let's check everything that is needed.

First the compilers

    # Run me!
    module load xxx
    
WRITE ME UP, at this stage it's impossible to precisely guide the students without access to the system.

The GPU version also strongly benefits from MKL libraries so, if possible, on Intel machines, use them.

## Configuring QE

A few important notes about the accelerated version of the code:

1. QE-GPU *requires* OpenMP.
2. You will have to specify where the CUDA Runtime is installed and its version and, in addition, the compute capabilities of the card that you plan to use. **Cards with different compute capabilities from the one specified at compile time will not execute the code correctly**. In addition you may run into wired error, be warned!
3. You will have to disable the parallel eigenvalue solver. 

This translates to this configure line:

    ./configure --with-cuda=XX --with-cuda-runtime=Y.y --with-cuda-cc=ZZ --enable-openmp --with-scalapack=no 

where `XX` is the location of the CUDA Toolkit (in HPC environments it is
generally $CUDA_HOME), `Y.y` is the version of the CUDA Toolkit (`Y` and `y` are the two numbers identifying major and minor release, e.g. 9.0)  and `ZZ` is the compute capability of the card.

**Question:** what is the compile configuration for the K40 and the V100?

Note that a helper script is also available in the `dev-tools` directory and can be used like this: `python get_device_props.py` but you must run it on the target compute node.

Once the configure script finishes, you should get something like this:

PUT HERE CONFIGURATION OUTPUT.


## Compilation

Only the `pw.x` is available for the time being. You compile it in the usual way:

    # Run me!
    make -j pw
