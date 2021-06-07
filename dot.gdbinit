# Python
python
import sys
from gdb.printing import register_pretty_printer

sys.path.insert(0, '/home/eltako/.bin/repo/gdb-utilities')

import my_pp
register_pretty_printer(gdb.current_objfile(), my_pp.netinet_pp())

import xxd

end

# call with dump_breaks file.txt
define dump_breaks
    set logging file $arg0
    set logging redirect on
    set logging on
    info breakpoints
    set logging off
    set logging redirect off
end

# Base brestore
define bsave
    shell rm -f brestore.txt
    set logging file brestore.txt
    set logging on
    info break
    set logging off
    # reformat on-the-fly to a valid gdb command file
    shell perl -n -e 'print "break $1\n" if /^\d+.+?(\S+)$/g' brestore.txt > brestore.gdb
end
document bsave
  store actual breakpoints
end

define brestore
  source brestore.gdb
end
document brestore
  restore breakpoints saved by bsave
end
