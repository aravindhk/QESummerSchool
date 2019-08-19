#
set encoding iso_8859_1
set term qt

# define x and y range here
xmin=10
xmax=35
ymin=-15.86
ymax=-15.80

set xrange [xmin:xmax]
set yrange [ymin:ymax]

# define x and y labels here

set xlabel "ecutwfc [Ry]"
set ylabel "Etot [Ry]"

plot \
     "ecutwfc-vs-Etot.dat" u 1:2 w lp ps 1.2 lw 2.0 pt 4,\

pause -1


# replot to *eps for storage

pause -1

set terminal postscript enhanced portrait color solid 'Arial' 15
set output "myplot.eps"
set size 0.85, 0.4

replot
