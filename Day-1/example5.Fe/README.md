# PURPOSE OF THE EXERCISE:
## How to calculate magnetic system (Iron bulk) and how to properly deal with ultrasoft pseudopotentials
---------------------------------------------------------------------


Exercise consists of three examples:

* `ex1.ecut/` -- convergence tests specific for ultrasoft
                 pseudopotentials.  Explore the influence of *dual*
                 parameter (i.e., *dual = ecutrho/ecutwfc*). Notice
                 that default *dual* of 4 is not sufficient for
                 ultrasoft pseudopotentials.


* `ex2.dos/` -- plot total DOS and DOS projected to s- and d-orbitals (PDOS)


* `ex3.afm/` -- antiferomegantic example (NOT YET implemented, see TODO file)

