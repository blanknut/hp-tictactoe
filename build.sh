#!/bin/bash

which comp41
if [ $? -ne 0 ]; then
    echo "error: cannot find lifutils"
    exit 1
fi

which ps2pdf
if [ $? -ne 0 ]; then
    echo "error: cannot find Ghostscript PS2PDF converter"
    exit 1
fi

# create HP-41 .RAW files (for emulators)
comp41 -l src/41ttt.txt >41ttt.raw
comp41 -l -x hpil src/41tttil.txt >41tttil.raw
comp41 -l src/41ttt-ppc.txt >41ttt-ppc.raw

# create HP-41 barcode files
prog41bar < 41ttt.raw | barps "HP-41 Tic Tac Toe" >41ttt.ps
prog41bar < 41tttil.raw | barps "HP-41 Tic Tac Toe (HP-IL)" >41tttil.ps
prog41bar < 41ttt-ppc.raw | barps "HP-41 Tic Tac Toe (PPC)" >41ttt-ppc.ps

ps2pdf 41ttt.ps
ps2pdf 41tttil.ps
ps2pdf 41ttt-ppc.ps

# create HP-41 LIF images
cat 41ttt.raw | raw41lif TTT > 41ttt.p41
cat 41tttil.raw | raw41lif TTTIL > 41tttil.p41
cat 41ttt-ppc.raw | raw41lif TTTPPC > 41ttt-ppc.p41

lifinit -z -m cass hp41ttt.dat 32
lifput hp41ttt.dat 41ttt.p41
lifput hp41ttt.dat 41tttil.p41
lifput hp41ttt.dat 41ttt-ppc.p41
lifdir hp41ttt.dat

# move generated files to corresponding subdirectories
if [ ! -d ./bin ]; then
	mkdir ./bin
fi

if [ ! -d ./barcode ]; then
	mkdir ./barcode
fi

if [ ! -d ./disks ]; then
	mkdir ./disks
fi

mv *.raw ./bin/
mv *.pdf ./barcode/
mv *.dat ./disks
rm *.ps *.p41
