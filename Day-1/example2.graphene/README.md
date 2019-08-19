PURPOSE OF THE EXERCISE
How to calculate and plot density-of-states (DOS) and band structure
(spaghetti) of a graphene sheet.
--------------------------------------------------------------------

Steps to perform:

#1) pw.x SCF calculation as to calculate Kohn-Sham states

       pw.x < pw.graphene.scf.in > pw.graphene.scf.out


## How to make a DOS plot
-------------------------

#2) pw.x non-SCF calculation with a denser k-mesh (for better DOS plot):

       pw.x < pw.graphene.nscf.in > pw.graphene.nscf.out


#3) dos.x calculation to make a DOS datafile:

       dos.x < dos.graphene.in > dos.graphene.out

    (the resulting DOS datafile is written to a graphene.dos file)


#4) plot the DOS with gnuplot:

       gnuplot dos.gp


## How to make a SPAGHETTI band-structure plot
----------------------------------------------

#5) pw.x "bands" calculation as to calculate the eigenvalues at
    k-points along a specific k-path:

       pw.x < pw.graphene.bands.in > pw.graphene.bands.out


#6) bands.x calculation as to make a suitable datafile for plotting:

       bands.x < bands.graphene.in > bands.graphene.out

    (the resulting datafile is written to graphene.bands.dat.gnu)


#7) plot the SPAGHETTI with gnuplot:

       gnuplot spaghetti.gp