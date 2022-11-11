'''
Contains all registers
'''

class Register(object):
    '''
    Register base class
    '''
    def __init__(self, _offset=0):
        self.offset = _offset

    def pwo(self):
        '''
        Print with offset
        '''
        return f"{self.offset}({self})"

    def update_offset(self, _new_offset=0):
        '''
        Updates register offset
        '''
        self.offset = _new_offset

class RSI(Register):
    '''
    rsi register
    Second argument, callee owned
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%rsi"

class RDI(Register):
    '''
    rdi register
    1st argument, callee owned
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%rdi"

class RNum(Register):
    '''
    r num register
    '''
    def __init__(self, _switch, _offset=0):
        Register.__init__(self, _offset)
        self.switch = _switch

    def __repr__(self):
        return f"%r{self.switch}"

class RBP(Register):
    '''
    rbp register
    This is the base pointer
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%rbp"

class RSP(Register):
    '''
    rsp register
    This is the stack pointer
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%rsp"

class RXX(Register):
    '''
    r_x register
    '''
    def __init__(self, _switch, _offset=0):
        Register.__init__(self, _offset)
        self.switch = _switch

    def __repr__(self):
        return f"%r{self.switch}x"

class EDI(Register):
    '''
    EDI register
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%edi"

class EAX(Register):
    '''
    EAX register
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%eax"

class R13D(Register):
    '''
    R13D register
    '''
    def __init__(self, _offset=0):
        Register.__init__(self, _offset)

    def __repr__(self):
        return "%r13d"