# Example 7: Calculation of the absorption spectrum of methane molecule (CH4) with hybrid pseudo-potential using the turbo_davidson.x code

 1. Run the SCF ground-state calculation

    ```
    mpirun -np 8 pw.x < Methane.scf.in > Methane.scf.out
    ```

 2. Run the turboDavidson calculation

    ```
    mpirun -np 8 turbo_davidson.x < Methane.davidson.in > Methane.davidson.out
    ```

 3. Run the spectrum calculation

    ```
    mpirun -np 8 turbo_spectrum.x < Methane.tddfpt_pp.in > Methane.tddfpt_pp.out
    ```

 4. Plot the spectrum using "gnuplot" and the script "plot_spectrum_nohyb.gnu". 
    You should obtain the no-hybrid spectrum.

    ```
    gnuplot -> load 'plot_spectrum_nohyb.gnu'
    evince Methane_spectrum.eps
    ```


 5. Switch on the hybrid pseudo-potential (B3LYP) 
    and see how changes the absorption spectrum of methane.

    Make the following modifications in the input files:
    
    ```
    * In the file 'Methane.scf.in' add in SYSTEM block input_dft = 'B3LYP'
    * In the file 'Methane.davidson.in'  set  d0psi_rs = .true.
    ```

    Once these modifications are done, repeat steps 1, 2, 3, and use the script "plot_spectrum_hyb.gnu"
    to plot the spectrum.     

   
