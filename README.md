# gdb utilities

A collection of useful gdb snippets picked up here and there:

- IP address pretty printer
- Hexdump
- Dump breakpoints
- Save and restore breakpoints

## Installation

Make sure you have the full version of gdb including python scripting (a lite
version is sometimes installed by default):
```
apt install gdb
```

Just copy dot.gdbinit as your ~/.gdbinit

## Sources

my_pp:
https://grim7reaper.rolinh.ch/blog/2014/09/04/pretty-printer-avec-gdb/

xxd:
https://stackoverflow.com/questions/9233095/memory-dump-formatted-like-xxd-from-gdb

dump_breaks:
https://prograide.com/pregunta/17550/obtenir-le-gdb-pour-enregistrer-une-liste-de-points-darrt

bsave/brestore :
https://stackoverflow.com/questions/501486/getting-gdb-to-save-a-list-of-breakpoints
