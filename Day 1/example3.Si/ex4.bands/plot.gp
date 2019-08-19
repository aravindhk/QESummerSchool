set grid xtics lt -1 lw 1
set format y "%5.1f"
set format x ""
set ylabel "Energy (Ry)"
unset xlabel

set xtics (0.0000, 0.8660, 1.8660, 2.3660, 2.8660, 4.2802)

plot [0:4.2802] 'Si.bands.dat.gnu' w linespoints lw 2 pt 4 ps 1.2
pause -1

