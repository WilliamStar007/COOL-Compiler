'''
This file has all assembly logic
'''

import config
from memory import RSP, RBP, RSI, RDI, RNum, RXX
from tree import *

rsp = RSP()
rbp = RBP()
rsi = RSI()
rdi = RDI()

rax = RXX('a')

r12 = RNum(12)
r13 = RNum(13)
r14 = RNum(14)

def cgen(exp):
    '''
    Code generation
    Recursively defined
    '''

    ret = ""

    # ***** ATTRIBUTES *****
    if isinstance(exp, Attribute):
        if exp.identifier.name == "(raw content)": #i.e. is internal
            obj = "0" if exp.typename.name == "Int" else "the.empty.string"

            ret += f"movq ${obj}, {r13}\n"
        else:
            if exp.typename.name in ["Bool", "Int", "String"]:
                # TODO
                return cgen(Integer(0, "Int", 0))

    # ***** EXPRESSION TERMINALS *****

    # Integer
    elif isinstance(exp, Integer):
        ret += "## new Int\n"
        ret += f"pushq {rbp}\n"
        ret += f"pushq {r12}\n"
        ret += f"movq $Int..new, {r14}\n"
        ret += f"call *{r14}\n"
        ret += f"popq {r12}\n"
        ret += f"popq {rbp}\n"


    # String
    elif isinstance(exp, StringObj):
        pass


    # True exp
    elif isinstance(exp, TrueExp):
        pass


    # False exp
    elif isinstance(exp, FalseExp):
        pass


    # Identifier exp
    elif isinstance(exp, IdentifierExp):
        pass


    # Identifier
    elif isinstance(exp, Identifier):
        pass


    # ***** EXPRESSION UNARY OPS *****


    # ***** EXPRESSION BINARY OPS *****


    # ***** EXPRESSION BLOCKS *****


    # ***** EXPRESSION DISPATCHES *****


    return ret


def print_vtables():
    '''
    Print program vtables
    '''
    str_num = 1
    ret = "\t\t\t## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    for key, val in config.impl_map.iterables():
        ret += f".globl {key}..vtable\n"

        # TODO: Def a better way to do this
        tmp = f"{key}..vtable:"
        tmp_len = len(tmp)
        num_spaces = 24 - tmp_len
        spaces = num_spaces * ' '

        ret += f"{tmp}{spaces}## virtual function table for {key}\n"
        ret += f"\t\t\t.quad string{str_num}\n"
        ret += f"\t\t\t.quad {key}..new\n"


        for method in val:
            ret += f"\t\t\t.quad {method.method_class}.{method.method_name}\n"

        ret += "\t\t\t## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
        str_num += 1

    return ret

def print_ctors():
    '''
    Print program constructors
    '''
    ret = ""

    class_names = []
    for key, _ in config.class_map.iterables():
        class_names.append(key)
    config.class_tags.assemble_dicts(class_names)


    for key, val in config.class_map.iterables():
        tmp = f"{key}..new:"
        tmp_len = len(tmp)
        num_spaces = 24 - tmp_len
        spaces = num_spaces * ' '

        ret += f".globl {key}..new\n"
        ret += f"{tmp}{spaces}## constructor for {key}\n"

        ret += f"pushq {rbp}\n"
        ret += f"movq {rsp}, {rbp}\n"

        ret += "## stack room for temporaries: 1\n"
        ret += f"movq $8, {r14}\n"
        ret += f"subq {r14}, {rsp}\n"

        ret += "## return address handling\n"
        ret += f"movq ${3 + len(val)}, {r12}\n"
        ret += f"movq $8, {rsi}\n"
        ret += f"movq {r12}, {rdi}\n"
        ret += "call calloc\n"
        ret += f"movq {rax}, {r12}\n"

        ret += "## store class tag, object size and vtable pointer\n"
        # Class tag
        r12.update_offset(0)
        ret += f"movq ${config.class_tags.get_tag(key)}, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"
        r12.update_offset(8)

        # Object size
        ret += f"movq ${3 + len(val)}, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"
        r12.update_offset(16)

        # Vtable
        # TODO: Don't include vtable if DNE
        ret += f"movq ${key}..vtable, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"
        r12.update_offset(24)

        if len(val) != 0:
            ret += "## initialize attributes\n"
            self_offset = 3
            for attr in val:
                ret += f"## self[{self_offset}] holds field {attr.identifier} ({attr.typename})\n"

                ret += cgen(attr)

                ret += f"movq {r13}, {r12.pwo()}\n"
                r12.update_offset(r12.offset + 8)
                self_offset += 1


        self_offset = 3
        for attr in val:
            ret += f"## self[{self_offset}] {attr.identifier} initializer -- "
            if not attr.expr:
                ret += "none\n"
            else:
                ret += f"{cgen(attr.expr)}\n"
                ret += f"movq {r12}, {r13}\n"
            self_offset += 1

            r12.update_offset()

        ret += f"movq {r12}, {r13}\n"
        ret += "## return address handling\n"
        ret += f"movq {rbp}, {rsp}\n"
        ret += f"popq {rbp}\n"
        ret += "ret\n"
        ret += "## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    return ret


def print_methods():
    '''
    Prints global methods
    '''
    ret = ""

    return ret


def print_cool_globals():
    '''
    Prints cool globals
    '''
    ret = ""

    return ret
