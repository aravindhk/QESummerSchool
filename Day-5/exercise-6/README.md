# Running QE-GPU

Efficient execution parameters for QE-GPU differ from those that you 
already obtained for the CPU version.

Here's a number of rules that you should generally follow:

1. use **one** MPI process per GPU device;
2. always activate OpenMP parallelism;
3. never use task-groups, never use the parallel eigensolver;
4. pool parallelism is generally useful, but be careful: it leads to 
   memory duplication and GPUs generally have less internal memory than 
   ordinary HPC nodes.



## Fe

Try to obtain the magnetic ground state of Iron with and without GPU acceleration. Do you observe any speed-up?

    # Run it!
    cd Fe

## CuO

Try to run the CuO input with GPU acceleration. Can you obtain a speedup with respect to the CPU only run?

    # Run it!
    cd CuO

## Si255Ge

Try to run the Si255Ge input with GPU acceleration. 
Can you obtain at least a 2x speedup with respect to the CPU run on the same node?

    # Run it!
    cd Si255Ge

