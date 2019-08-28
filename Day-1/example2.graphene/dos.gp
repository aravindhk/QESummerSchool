# set Fermi energy to correct value
Efermi=0.0

set grid
set xzeroaxis lt -1
set xlabel "Energy (eV)"
set ylabel "DOS"
set style fill solid 0.4
set yzeroaxis lt -1

set title "Total DOS\n( press <Enter> in the terminal to exit ... )"

plot [:][:] \
     'graphene.dos' u ($1-Efermi):2 notit w filledcurve lt 1, \
     'graphene.dos' u ($1-Efermi):2 notit w l lt 1 lw 2
pause -1