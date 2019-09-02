PURPOSE OF THE EXERCISE 
How to calculate the phonon dispersion of 2D hexagonal Boron Nitride.

Steps to perform:

#1) Run the SCF ground-state calculation

mpirun -np 2 pw.x < bn_scf.in > bn_scf.out

#2) Run the phonon calculation on a uniform grid of q-points

mpirun -np 2 ph.x < bn_ph.in > bn_ph.out

#3) Fourrier transform the Interatomic Force Constants from a uniform grid of q-points to real space: C(q) => C(R)

mpirun -np 2 q2r.x < bn_q2r.in > bn_q2r.out

#4) Calculate frequencies omega(q') at generic q' points using Interatomic Force Constants C(R)

mpirun -np 2 matdyn.x < bn_matdyn.in > bn_matdyn.out

#5) Plot the phonon dispersion of silicon 

plotband.x < bn_plotband.in > bn_plotband.out

gnuplot plot_dispersion.gnu

evince phonon_dispersion.eps 
