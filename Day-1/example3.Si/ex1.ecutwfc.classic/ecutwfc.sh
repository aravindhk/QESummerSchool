#!/bin/sh
# reminder: from now on, what follows the character # is a comment
####################################################################
#
# define the following variables according to your needs
#
outdir=/tmp
pseudo_dir=../../../pseudo
# the following is not actually used:
# espresso_dir=top_directory_of_espresso_package
####################################################################

rm -f pw.si.eos.out si.etot_vs_alat
touch si.etot_vs_alat

for alat in 9.8 9.9 10.0 10.1 10.2 10.3 10.4 10.5 10.6 10.7
do

    # self-consistent calculation
    cat > pw.si.eos.in << EOF
 &CONTROL
    prefix='silicon',
    pseudo_dir = '$pseudo_dir/',
    outdir='$outdir/'
 /
 &SYSTEM    
    ibrav =  2, 
    celldm(1) = $alat, 
    nat =  2, 
    ntyp = 1,
    ecutwfc = 20.0, 
 /
 &ELECTRONS
 /
ATOMIC_SPECIES
   Si  28.086  Si.pz-vbc.UPF
ATOMIC_POSITIONS
   Si 0.00 0.00 0.00 
   Si 0.25 0.25 0.25 
K_POINTS automatic
   4 4 4 1 1 1
EOF

    # If pw.x is not found, specify the correct value for $espresso_dir,
    # use $espresso_dir/bin/pw.x instead of pw.x

    pw.x -in pw.si.eos.in > pw.si.eos.out

    grep -e 'lattice parameter' -e ! pw.si.eos.out | \
        awk '/lattice/{alat=$(NF-1)}/!/{print alat, $(NF-1)}' >> si.etot_vs_alat

done

gnuplot plot.gp
