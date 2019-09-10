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

Try to obtain the magnetic ground state of Iron with and without GPU acceleration.
Modify the jobscript file of one of the previous examples in order to efficiently
run the GPU version of the code.
Do you observe any speed-up?

    # Run it!
    cd Fe
    # Edit the input file and correct `pseudo_dir` and `outdir`.
    # The pseudopotential can be downloaded from https://www.quantum-espresso.org/upf_files/Fe.pbe-nd-rrkjus.UPF
    wget https://www.quantum-espresso.org/upf_files/Fe.pbe-nd-rrkjus.UPF

## CuO

Try to run the CuO input with GPU acceleration by change the jobscript given in 
the previous exercise.
Try with `-npool 1` and `-npool 2` and remember to exploit OpenMP parallelism.
Can you obtain a speedup with respect to the CPU only run?

    # Run it!
    cd CuO

## Si255Ge

Try to run the Si255Ge input with and without GPU acceleration. 
Can you obtain at least a 2x speedup with respect to the CPU run on the same node?
Pro tip: you can disable the GPU acceleration with the command `export USEGPU=no`, 
you can re-enable it with `export USEGPU=yes` or with `unset USEGPU`.

    # Run it!
    cd Si255Ge

