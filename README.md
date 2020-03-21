# Tic-Tac-Toe for HP-85 and HP-41C

The famous Tic-Tac-Toe game for HP-85 computers as well as HP-41
calculators. There is also a variant of the programs where an HP-85 plays
against an HP-41 connected via HP-IL, a reference to the movie
[WarGames](https://en.wikipedia.org/wiki/WarGames).

![https://calc.fjk.ch/wer-gewinnt?/](https://calc.fjk.ch/wp-content/uploads/wargames.png)

## Requirements

To play Tic-Tac-Toe against an HP-85 computer or an HP-41 calculator, you
can use one of the emulators listed below. Of course, the preferred and
funnier way is to play it on real vintage hardware!

If you want to let an HP-85 play against an HP-41, you need the real
hardware as well as an 82938A HP-IL interface for the HP-85 and a 82160A
HP-IL interface for the HP-41. Furthermore, the 82938A interface has to
be configured as *Non-System Controller* (because the HP-41 always assumes
the role of system controller). Unfortunately, the preset is *System
Controller* and you have to open the interface to change this setting.
I've modifed my 82938A interface and installed a toggle switch so I can
change the mode without opening it.

## The Programs

- HP-41 programs:
  - ./src/41ttt-ppc.txt: This HP-41 program was written by Christopher
     Rath (thank you!) and requires the PPC module. I used it as the
     base for the other HP-41 programs.
  - ./src/41ttt.txt: Mostly identical to 41ttt-ppc.txt except that it
    does *not* need the PPC module.
  - ./src/41tttil.txt: This HP-41 program plays Tic-Tac-Toe against an
    opponent connected to the calculator via HP-IL.
- HP85 programs:
  - ./src/85ttt.txt: This HP-85 program plays Tic-Tac-Toe against a
    human opponent. The board is displayed as graphics.
  - ./src/85tttil.txt: This HP-85 program plays Tic-Tac-Toe against an
    opponent connected to the computer via HP-IL.

## Loading Programs

- The most boring and time consuming way is to type the programs into
  your computer or calculator.
- If you own an optical wand 82153A for your HP-41 calculator you'll
  find barcodes of the programs in directory ./barcode.
- If you use the V41 emulator you can load the programs using the
  *.raw files in directory ./bin. Of course this works for many other
  HP-41 emulators.
- If you use Everett Kaser's HP-85 emulator there is a disk image TTT85
  in directory ./disks containing all the HP-85 programs.
- If you own a PIL-Box you'll find a disk image TTT41 in directory
  ./disks containing all the HP-41 programs.

## Usage

All the programs use the board layout shown below. To make a draw
just enter the number of the corresponding square.
```
+---+---+---+
| 7 | 8 | 9 |
+---+---+---+
| 4 | 5 | 6 |
+---+---+---+
| 1 | 2 | 3 |
+---+---+---+
```

41ttt-ppc and 41ttt:
- `XEQ "TTT"`
- Enter seed, then press `R/S`
- The calculator randomly selects who starts the game
- If it's your turn enter your draw and press `R/S`
- After some thinking the calculator will display his draw

85ttt:
- should be self-explaining, just `RUN` it.

41tttil and 85tttil:
- Make sure that the HP-85 HP-IL interface is configured as
  *Non-System Controller*.
- Connect the HP-41 and HP-85 via HP-IL interface.
- `RUN` the HP-85 program.
- When you're prompted to start the opponent, run the HP-41 program
  entering `XEQ "TTTIL"`.
- Watch and enjoy!

## Emulators

[HP-85](http://www.kaser.com/hp85.html):
A fantastic emulator of the great HP-85 computer, written by Everett Kaser.
Still actively maintained and extended.

[HP-41C](http://www.hp41.org/Emulation.cfm):
There are many excellent HP-41 emulators. Personally I most often use V41
written by Warren Furlow, the maintainer of the hp41.org site.

## References

- Christopher Rath: [Tic-Tac-Toe Algorithm & HP-41C Implementation](http://www.rath.ca/).
- Jean-François Garnier: [HP-IL Resource Page](http://www.jeffcalc.hp41.eu/hpil/).
- [pyILPER](https://github.com/bug400/pyilper): a great emulation of virtual
  HP-IL devices.
