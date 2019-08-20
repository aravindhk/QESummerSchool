set terminal post eps enhanced solid color "Helvetica" 20
set output "Benzene_spectrum.eps"
set xrange [0:9.0]
set yrange [0:0.3]
set xtics 0.0, 1.0, 9.0
set xlabel "{/Symbol w} (eV)"
set ylabel "Intensity (arb. units)"
plot "Benzene.plot_chi.dat" u ($2)*13.6:($4)*0.00025 w l lw 2 title 'turbo-lanczos.x (interacting electrons)', \
     "../exercise2/reference/with_interaction/Benzene.plot" u ($1)*13.6:($3)*0.00600 w l lw 2 title 'turbo-davidson.x (interacting electrons)' 
