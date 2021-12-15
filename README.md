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
Put the following in your .gdbinit:

```gdb
define esp_source_scripts
source path/to/gdb-utilities/esp_tools.gdb
source path/to/gdb-utilities/stackfuncs.gdb
source path/to/gdb-utilities/dot.gdbinit
end
```

## Usage with cgdb

Define an alias that uses the correct gdb:

```bash
alias esp-cgdb='/usr/bin/cgdb -d xtensa-esp32-elf-gdb'
```

You can then use it as follows:

```bash
# First console
idf.py monitor openocd
#Second console
esp-cgdb path/to/build/projectname.elf
```

Within openocd:

```bash
esp_source_scripts
esp_connect
esp_reboot_to_main
```

## Sources

my_pp:
https://grim7reaper.rolinh.ch/blog/2014/09/04/pretty-printer-avec-gdb/

xxd:
https://stackoverflow.com/questions/9233095/memory-dump-formatted-like-xxd-from-gdb

dump_breaks:
https://prograide.com/pregunta/17550/obtenir-le-gdb-pour-enregistrer-une-liste-de-points-darrt

bsave/brestore :
https://stackoverflow.com/questions/501486/getting-gdb-to-save-a-list-of-breakpoints
