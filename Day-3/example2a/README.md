PURPOSE OF THE EXERCISE 
How to calculate the phonon frequencies of the polar semiconductor AlAs at the Gamma point.

Steps to perform:

#1) Run the SCF ground-state calculation

mpirun -np 2 pw.x < AlAs_scf.in > AlAs_scf.out

#2) Run the phonon calculation at Gamma

mpirun -np 2 ph.x < AlAs_ph.in > AlAs_ph.out

#3) Impose the acoustic sum rule at the Gamma point and add the non-analitic LO-TO splitting

mpirun -np 2 dynmat.x < AlAs_dynmat.in > AlAs_dynmat.out
