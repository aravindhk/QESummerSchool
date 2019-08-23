# Exercise 3

Let's now go through the parallel options of pw.x with the help of some examples.

## Pools

The first option to consider is `-npool`. This sets the number of concurrent workers that will split the demanding task of solving the KS Hamiltonian on the given grid of reciprocal space points.

    # Run it!
    cd Material1

## Parallel eigensolver

When the size of the matrix containing the reduced Hamiltonian elements becomes large, you can speedup the code by solving the generalized eigenvalue problem with multiple cores.
This is done for example in `Material 2`

    # Run it!
    cd Material2

## Task groups

In addition, the parallel performance of the code may be improved by batching together the Fourier transform of multiple bands in the application of the local operators (one of the most time consuming tasks in pw.x execution).
You will check this in the directory `Material 3`

## OpenMP

When parallel performance saturation is reached, an additional level of parallelism based on OpenMP can further reduce the time to solution.
This is shown in `Material 4` (but will probably require some time to run).

