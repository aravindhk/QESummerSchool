# Example 6: Calculation of the absorption spectrum of benzene molecule (C6H6) using the turbo_lanczos.x code

 1. Run the SCF ground-state calculation

    ```
    mpirun -np 8 pw.x < Benzene.scf.in > Benzene.scf.out
    ```

 2. Perform Lanczos recursions 

    ```
    mpirun -np 8 turbo_lanczos.x < Benzene.lanczos.in > Benzene.lanczos.out
    ```

 3. Run the spectrum calculation

    ```
    mpirun -np 8 turbo_spectrum.x < Benzene.tddfpt_pp.in > Benzene.tddfpt_pp.out
    ```

 4. Plot the spectrum using "gnuplot" and the script "plot_spectrum.gnu". 
    This script will make a comparison of the spectra
    calculated using turbo_lanczos.x and turbo_davidson.x

    ```
    gnuplot -> load 'plot_spectrum.gnu'
    evince Benzene_spectrum.eps
    ```
