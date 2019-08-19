set terminal post eps enhanced solid color "Helvetica" 20
set output "Na2_spectrum.eps"
set xrange [0:0.5]
set yrange [0:110.0]
set xtics 0.0, 0.1, 0.5
set xlabel "{/Symbol w} (Ry)"
set ylabel "Intensity (arb. units)"

plot "Na2.plot_S.dat" u 2:3 w l lw 2 title 'Spectrum of Na2'

#plot "Na2.plot_S.50.dat" u 2:3 w l lw 2 title '50 iterations', \
#     "Na2.plot_S.100.dat" u 2:3 w l lw 2 title '100 iterations', \
#     "Na2.plot_S.200.dat" u 2:3 w l lw 2 title '200 iterations', \
#     "Na2.plot_S.300.dat" u 2:3 w l lw 2 title '300 iterations'
