# The explanation of filenames

- `*.in` and `*.out` -- Quantum ESPRESSO (QE) input and output (I/O)
  files, respectively
- `*.pwtk`         -- PWTK scripts
- `*.gp`           -- Gnuplot scripts
- `*.sh`           -- Unix shell-scrips


## QE input/output filenames use the following logic:

    program.system.task.in
    program.system.task.out

where *program* is the name of the program, e.g., pw (for `pw.x`) or
pp (for `pp.x`), *task* is the description of the type of calculation,
such as scf or bands, whereas *system* is the name of the structure to
be calculated.

**Examples:**

* `pw.Si.scf.in`   -- pw.x input file for SCF calculation of Silicon
* `pw.Si.bands.in` -- pw.x input file for `calculation = 'bands'` of Silicon
* `pp.benzene.psi2.in` -- pp.x input file for calculation the |psi(r)|^2 of benzene

For simpler, one-purpose, programs, the *task* is ommited, e.g.:

* `bands.Si.in` -- bands.x input file for Silicon
