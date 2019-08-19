#
set encoding iso_8859_1
set term qt

# define x and y range here
xmin=0
xmax=10
ymin=-15.85
ymax=-15.82

set xrange [xmin:xmax]
set yrange [ymin:ymax]

# define x and y labels here

set xlabel "nkpts"
set ylabel "Etot [Ry]"

plot \
     "Etot-vs-nkpts.dat" u 1:2 w lp ps 1.2 lw 2.0 pt 4,\

pause -1


# replot to *eps for storage

pause -1

set terminal postscript enhanced portrait color solid 'Arial' 15
set output "myplot.eps"
set size 0.85, 0.4

replot
