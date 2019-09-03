set samples 50
set isosamples 50
set contour
set pm3d interpolate 5,5 map
set palette file "-"
0 0 0.5
0.5 0.5 1
1 1 1
1 0.5 0.5
0.5 0 0
end

E0=-253.16419914

set title "{/Symbol D} Energy (Ry)"
set xlabel "A (angstrom)"
set ylabel "C (angstrom)"
set clabel "%5.2f"
set cbtics 0.0,0.002,0.01
set cbrange [0.0:0.01]
set contour base
set cntrparam cubicspline levels incremental 0.0,0.002,0.01
set format "%.2f"
set format cb "%.3f"
set xrange [2.6:3.0]
set yrange [4.2:4.6]

set xtics 2.6, 0.05
set ytics 4.2, 0.05
splot 'Zn-energies.dat' u 1:2:($3-E0) notitle with pm3d lt 1 lw 2
pause -1
