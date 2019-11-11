from gdb.printing import RegexpCollectionPrettyPrinter
from . import netinet

def netinet_pp():
    pp = RegexpCollectionPrettyPrinter("netinet")
    pp.add_printer('in_addr',  '^in_addr$',  netinet.ipv4Printer)
    pp.add_printer('in6_addr', '^in6_addr$', netinet.ipv6Printer)
    return pp
