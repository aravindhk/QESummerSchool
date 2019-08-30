# Example 5: Calculation of the absorption spectrum of benzene molecule (C6H6) using the turbo_davidson.x code

 1. Run the SCF ground-state calculation

    ```
    mpirun -np 8 pw.x < Benzene.scf.in > Benzene.scf.out
    ```

 2. Run the turboDavidson calculation

    ```
    mpirun -np 8 turbo_davidson.x < Benzene.davidson.in > Benzene.davidson.out
    ```

 3. Run the spectrum calculation

    ```
    mpirun -np 8 turbo_spectrum.x < Benzene.tddfpt_pp.in > Benzene.tddfpt_pp.out
    ```

 4. Plot the spectrum using "gnuplot" and the script "plot_spectrum.gnu". 
    Since the interaction was switched off, you should obtain the same spectrum 
    as the one obtained using the epsilon.x code in the example4.

    ```
    gnuplot -> load 'plot_spectrum.gnu'
    evince Benzene_spectrum.eps
    ```


 5. Switch on the electronic interaction (Hartree and Exchange-Correlation) 
         and see how changes the absorption spectrum of benzene.

    Make the following modifications in the input files:
    
    ```
    * In the file 'Benzene.davidson.in'  set  if_dft_spectrum = .false.
    * In the file 'Benzene.tddfpt_pp.in' set  eign_file = 'Benzene.eigen'
    * In the script 'plot_spectrum.gnu' change the title to 'turbo-davidson.x (interacting electrons)'
    ```

    Once these modifications are done, repeat steps 2, 3, and 4.   
