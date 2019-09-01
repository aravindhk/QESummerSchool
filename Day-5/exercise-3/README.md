# Exercise 3

Let's now go through the parallel options of pw.x with the help of some examples.

## Pools

The first option to consider is `-npool`. This sets the number of concurrent workers that will split the demanding task of solving the KS Hamiltonian on the given grid of reciprocal space points.

    # Run it!
    cd CuO

## Task groups

In addition, the parallel performance of the code may be improved by batching together the Fourier transform of multiple bands in the application of the local operators (one of the most time consuming tasks in pw.x execution).
You will check this in the directory `CuO`

## Parallel eigensolver

When the size of the matrix containing the reduced Hamiltonian elements becomes large, you can speedup the code by solving the generalized eigenvalue problem with multiple cores.
This is done for example in `C70`

    # Run it!
    cd C70

## OpenMP

When parallel performance saturation is reached, an additional level of parallelism based on OpenMP can further reduce the time to solution.
This is shown again in `C70`.

