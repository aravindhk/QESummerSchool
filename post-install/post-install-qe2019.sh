#!/bin/bash -x

#
# a script to install the required packages for QE-2019 school (user
# requires elevated privilages, i.e., sudo)
#

SUDO=${SUDO:-sudo}
APT=${APT:-apt-get}

dir=`dirname $0`
cd $dir
installdir=$(pwd)

$SUDO $APT update
$SUDO $APT install \
      ssh make gfortran gcc quantum-espresso \
      libblas-dev libfftw3-dev liblapack-dev openmpi \
      tcllib tk libtogl2 itk3 iwidgets4 bwidget libgl2ps1.4 \
      vim emacs gnuplot grace octave imagemagick mencoder bc \
      openbabel bkchem gperiodic \
      git python2.7-dev python3-dev python-pip virtualenv postgresql postgresql-server-dev-all postgresql-client rabbitmq-server \ 

xc=xcrysden-1.6.0-rc2-bin-shared
pwgui=PWgui-6.4
pwtk=pwtk-1.0.0-rc2
qemodes=QE-modes-6.4

# input name of exercises tar here 
exercises=Day-1+pseudo.tgz

tmp_pkgs=$qemodes.tar.gz
opt_pkgs="$pwgui.tgz $pwtk.tar.gz $xc.tar.gz" 
# DO NOT TOUCH

$SUDO mkdir -p /opt/bin

function tar_open() {
    if test $# -ne 2; then
        echo "Usage: $0 package_list where"
        exit 1
    fi
    pkgs=$1
    where=$2
    for pkg in $pkgs
    do 
        if [ ! -f $pkg ]; then 
            echo "Package $pkg is missing ..."
            exit 1
        else
            $SUDO tar zxvf $pkg -C $where
        fi
    done
}

tar_open "$opt_pkgs"  /opt
tar_open "$tmp_pkgs"  /tmp

# POST-PROCESSING

# QE-emacs-modes
(
    cd /tmp/$qemodes
    ./install.sh
    cp qe-modes.emacs $HOME/.emacs
)
# configure emacs
cat <<EOF >> $HOME/.emacs
(setq inhibit-splash-screen t) 
(add-to-list 'auto-mode-alist '("\\\\.pwtk\\\\'" . tcl-mode))
(add-to-list 'auto-mode-alist '("\\\\.xcrysden\\\\'" . tcl-mode))
EOF

# configure vim for pwtk ... 
cat <<EOF > $HOME/.vimrc
syntax on
filetype on 
au BufNewFile,BufRead *.pwtk set filetype=tcl

EOF

# make symlinks to /opt/bin/

(
    cd /opt/bin/
    
    $SUDO ln -s /opt/$xc/xcrysden .
    $SUDO ln -s /opt/$xc/util/ptable .
    $SUDO ln -s /opt/$xc/util/unitconv .
    $SUDO ln -s /opt/$xc/scripting/pwi2xsf.sh pwi2xsf
    $SUDO ln -s /opt/$xc/scripting/pwo2xsf.sh pwo2xsf

    $SUDO ln -s /opt/$pwgui/pwgui .
    $SUDO ln -s /opt/$pwtk/pwtk   .
)

# pwtk configuration
mkdir -p $HOME/.pwtk
cp $installdir/pwtk.tcl $HOME/.pwtk/

# xcrysden customization
mkdir -p $HOME/.xcrysden
cp $installdir/custom-definitions $HOME/.xcrysden

# append the required PATH to .bashrc

if test "x$(echo $PATH | grep /opt/bin)" == "x"; then
    echo 'export PATH=/opt/bin/:$PATH' >> $HOME/.bashrc
else
    echo "PATH allready changed; skipping" 
fi

if test "x$(echo $ESPRESSO_TMPDIR)" == "x"; then
    echo 'ESPRESSO_TMPDIR=/tmp' >> $HOME/.bashrc
else
    echo "ESPRESSO_TMPDIR allready defined to $ESPRESSO_TMPDIR; skipping" 
fi

if test "x$(echo $ESPRESSO_PSEUDO)" == "x"; then
    echo 'ESPRESSO_PSEUDO=$HOME/QE-2019/pseudo' >> $HOME/.bashrc
else
    echo "ESPRESSO_PSEUDO already defined to $ESPRESSO_PSEUDO; skipping" 
fi

#
# unpack exercises 
#

mkdir -p $HOME/QE-2019

tar_open $exercises $HOME/QE-2019/

for i in {1..5}; do
    ln -s  $HOME/QE-2019/Day-$i  $HOME/Desktop/Day-$i
done
