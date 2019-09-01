# Advanced QE-GPU

A few other tricks can be used to further reduce the time to solution.

## GPU oversubscription

While the rule of thumb for the GPU version of QE is 1 MPI process per GPU, depending on the input you may benefit from *oversubscribing* the GPU with multiple processes per GPU card.

Try to run the previous examples with 2 MPI processes per GPU and 4 MPI processes per GPU. Can you observe improvements?

## CUDA-Aware MPI

The general scheme for MPI communication in QE is the following:


On some systems this has a sizable impact on the performance of data communication and, whenever possible, 
a better communication strategy that can exploit direct GPU to GPU channels (like NVlink) can be setup by recent
versions of OpenMPI.

The following command can be used to check whether the OpenMPI version installed on your system support sending and receiving data residing on the GPU memory:

    ompi_info --parsable -l 9 --all | grep mpi_built_with_cuda_support:value

if the answer is:

    mca:mpi:base:param:mpi_built_with_cuda_support:value:true

you can try to enable this feature in QE. At the time of writing this is still an experimental feature that can be enabled adding the flag

    -D__GPU_MPI

after the line containing `-D__MPI`.

Recompile the code and run one of the previous input files. Do you find any speedup?