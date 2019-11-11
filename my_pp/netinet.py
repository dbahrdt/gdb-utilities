from struct import pack
from socket import inet_ntop, AF_INET, AF_INET6

from gdb import lookup_type

class ipv4Printer(object):
    def __init__(self, val):
        self.addr = pack('I', int(val['s_addr']))

    def to_string(self):
        return inet_ntop(AF_INET, self.addr)

class ipv6Printer(object):
    def __init__(self, val):
        # IPv6 addresses have a size of 128 bits (== 16 octets).
        N = 16
        addr = val.cast(lookup_type("uint8_t").array(N))
        self.addr = pack('B'*N, *[int(addr[i]) for i in range(N)])

    def to_string(self):
        return inet_ntop(AF_INET6, self.addr)
