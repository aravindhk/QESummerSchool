This simulation uses the gamma point to sample the reciprocal space so you cannot exploit pool parallelism.

Modify the jobscript

    #SBATCH --nodes=1
    #SBATCH --ntasks=16
    #SBATCH --ntasks-per-node=16
    #SBATCH --cpus-per-task=1
    #SBATCH --ntasks-per-core=1
    #SBATCH --reservation=qe2019
    #SBATCH --gres=gpu:2
    
    module load mpi/openmpi-x86_64 MKL/mkl_2019.4.243
    
    export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK   # you may also check what happens if you foget this.
    
    mpirun /path/to/bin/pw.x -inp  pw.C70.scf.in > pw.C70.scf.out

in order to:

i. try to improve the time to solution using the `-ndiag` and `-ntg`.
ii. Try now reducing the number of MPI processes and increasing the OpenMP threads. Is the time to solution reduced?

