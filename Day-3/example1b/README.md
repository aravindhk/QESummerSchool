PURPOSE OF THE EXERCISE 
How to calculate the phonon dispersion of silicon.

Steps to perform:

#1) Run the SCF ground-state calculation

mpirun -np 2 pw.x < Si_scf.in > Si_scf.out

#2) Run the phonon calculation on a uniform grid of q-points

mpirun -np 2 ph.x < Si_ph.in > Si_ph.out

#3) Fourrier transform the Interatomic Force Constants from a uniform grid of q-points to real space: C(q) => C(R)

mpirun -np 2 q2r.x < Si_q2r.in > Si_q2r.out

#4) Calculate frequencies omega(q') at generic q' points using Interatomic Force Constants C(R)

mpirun -np 2 matdyn.x < Si_matdyn.in > Si_matdyn.out

#5) Plot the phonon dispersion of silicon 

plotband.x < Si_plotband.in > Si_plotband.out

gnuplot plot_dispersion.gnu

evince phonon_dispersion.eps 
