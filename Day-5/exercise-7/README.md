# Running QE-GPU

Efficient execution parameters for QE-GPU strongly differ from those of the CPU version.

Here's a number of rule you should generally follow as of today:

1. use **one** MPI process per GPU device.
2. always activate OpenMP parallelism.
3. never use task-groups, never use the parallel eigensolver.
4. pool parallelism is generally useful, but be careful since it duplicates memory and GPUs have little.



## A small test case

TODO: small case where no acceleration is observed

## A medium test case

TODO: medium test case some acceleration is observed

## A large test case

TODO: large test case where the expected 3x-5x speedup (w.r.t. CPU only) is observed.


