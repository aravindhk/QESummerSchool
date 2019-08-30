# Example 4: Calculation of the absorption spectrum of benzene molecule (C6H6) using the Independent Particle Approximation

 1. Run the SCF ground-state calculation

    ```
    mpirun -np 8 pw.x < Benzene.scf.in > Benzene.scf.out
    ```

 2. Run the spectrum calculation

    ```
    mpirun -np 8 epsilon.x < Benzene.epsilon.in > Benzene.epsilon.out 
    ```

 3. Plot the spectrum using "gnuplot" and the script "plot_spectrum.gnu":

    ```
    gnuplot -> load 'plot_spectrum.gnu'
    evince Benzene_spectrum.eps
    ```
