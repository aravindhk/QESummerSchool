# CuO

Complete the input file by setting a scratch directory and prepare a jobscript to use a single node.

Run the first simulation without any parallel parameter, i.e.:

    #SBATCH --nodes=1
    #SBATCH --ntasks=16
    #SBATCH --ntasks-per-node=16
    #SBATCH --cpus-per-task=1
    #SBATCH --ntasks-per-core=1
    #SBATCH --reservation=qe2019
    #SBATCH --gres=gpu:2
    
    module load mpi/openmpi-x86_64 MKL/mkl_2019.4.243
    
    export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK   # you may also check what happens if you foget this.
    
    mpirun /path/to/qe/bin/pw.x -inp pw.CuO.scf.in > pw.CuO.scf.out 

and record the time to solution by inspecting the output. The relevant 
parameter is the wall time taken by the PWSCF clock. You can get it with
grep:

    grep 'PWSCF   ' pw.CuO.scf.out

Your task is to reduce this timer as much as possible, but trying all possible
combinations of parameters would require too much time: make wise decisions.

The following points may guide you:

i. try first to improve the time to solution by using the `-npool` option.
ii. try to further reduce the time to solution using the `-ndiag` options. 
    What are the appropriate values for this parameter for a given `npool` value? Is the time to solution reduced?
ii. try to further reduce the time to solution using the `-ntg` options.  Does the time to solution improve? Why not?

You should eventually be able to complete the 10 scf steps in less than 7 min.
