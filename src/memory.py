'''
Contains all registers and cgen
'''

class Register(object):
    '''
    Register base class
    '''

class FP(Register):
    def __init__(self, _offset=None):
        self.offset = _offset
    def __repr__(self):
        if self.offset:
            return f"fp[{self.offset}]"
        else:
            return "fp"

class SP(Register):
    def __init__(self, _offset=None):
        self.offset = _offset
    def __repr__(self):
        if self.offset:
            return f"sp[{self.offset}]"
        else:
            return "sp"

class R(Register):
    def __init__(self, _which, _offset=None):
        self.which = _which
        self.offset = _offset

    def off(self, offset):
        return R(self.which, offset)

    def __repr__(self):
        if self.offset:
            return f"r{self.which}[{self.offset}]"
        else:
            return f"r{self.which}"


classes = ['Object', 'IO', 'Main', 'Int', 'Bool']

self_reg = R(0)
acc_reg = R(1)
tmp_reg = R(2)

vtable_offset = 0
int_constant_offset = 1


def cgen(exp):
    if isinstance(exp, Variable):
        pass

    elif isinstance(exp, Int):
        cgen(New ('Int'))
        print(f"\t\tli {tmp_reg} <- {exp.value}")
        print("\t\tst {acc_reg}[{int_constant_offset}] <- {tmp_reg}")

        return acc_reg

    elif isinstance(exp, New):
        print("\t\tpush fp")
        print("\t\tpush {self_reg}")

        print(f"\t\tla {tmp_reg} <- {exp.new_type}..new")
        print(f"\t\tcall {tmp_reg}")
        print(f"\t\tpop {self_reg}")
        print("\t\tpop fp")

        return acc_reg

    elif isinstance(exp, Dispatch):
        ro_type = 'Main' # TODO: Fix, get obj type
        method_offset = -1
        for i, method in enumerate(implementation_map[ro_type]):
            if method.method_name == exp.method:
                method_offset = i + 1
        # Push params onto the stack
        for i, formal in enumerate(exp.formals):
            f_loc = cgen(formal)
            print(f"\t\tpush {f_loc}")

        ro_loc = cgen(exp.ro)

        # Retrieve vtable from ro
        print(f"\t\tld {tmp_reg} <- {ro_loc}[{vtable_offset}]")

        # Retrieve method from vtable
        print(f"\t\tld {tmp_reg} <- {tmp_reg}[{method_offset}]")

        print("\t\tpush fp")
        print(f"\t\tpush {self_reg}")

        print("\t\tcal {tmp_reg}")

        print(f"\t\tpop {self_reg}")
        print("\t\tpop fp")

        print(f"\t\tmov {acc_reg} <- {tmp_reg}")

        return acc_reg

    elif isinstance(exp, Internal):
        # Generate custom asm for each internal method

        if exp.method == 'IO.out_int':
            v_loc = cgen(Variable("x"))

            print(f"ld {tmp_reg} <- {v_loc}")

            print(f"\t\tld {tmp_reg} <- {tmp_reg}[{int_constant_offset}]")
            # Load int into r1 for syscall       
            print(f"\t\tmov r1 <- {tmp_reg}")

            print("syscall IO.out_int")

            return acc_reg

    elif isinstance(exp, Plus):
        # Need 3 registers
        # Eval first operand, store result in a resgister

        e1_loc = cgen(exp.lhs) # lhs?
        print(f"\t\tmov {tmp_reg} <- {e1_loc}")
        print(f"\t\tld {tmp_reg} <- {tmp_reg}[{int_constant_offset}]")

        # Eval second operand, get resulting int obj
        e2_loc = cgen(exp.rhs) # rhs?
        print(f"\t\tmov {acc_reg} <- {e2_loc}")
        # Load unboxed integer constant value from int offset
        print(f"\t\tld {acc_reg} <- {acc_reg}[{int_constant_offset}]")

        # Add values together
        print(f"\t\tadd {acc_reg} <- {acc_reg} {tmp_reg}")

        print(f"\t\tpush {acc_reg}")

        # Create new Int obj
        cgen(New ('Int'))

        # Retrieve saved val
        print(f"\t\tpop {tmp_reg}")

        # Throw that value into the newly-created int
        print(f"\t\tst {acc_reg}[{int_constant_offset}] <- {tmp_reg}")

        return acc_reg