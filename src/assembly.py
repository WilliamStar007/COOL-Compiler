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


def cgen(exp, ident=None):
    '''
    Code generation
    Recursively defined
    '''

    ret = ""

    # ***** ATTRIBUTES *****
    if isinstance(exp, Attribute): # TODO: Def a better way to do this
        if exp.identifier.name == "(raw content)":
            obj = "0" if exp.typename.name == "Int" else "the.empty.string"
            ret += f"movq ${obj}, {r13}"

        else:
            if exp.typename.name in ["Bool", "Int", "String"]:
                return cgen(Expression(exp.in_class, 0, exp.typename.name))
            else: # i.e. is an identifier
                ret += f"movq $0, {r13}"

    # ***** EXPRESSION TERMINALS *****

    # Int
    elif isinstance(exp, Integer):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Int'))}\n"
        ret += f"movq ${exp.value}, {r14}\n"

        # TODO: Find offset for the last line

        offset = None
        reg = None

        if ident: # TODO: Hardcode this less
            tpl = config.symbol_table.top(exp.in_class, ident)
            offset = tpl[0] * config.OFFSET_AMT
            reg = tpl[1]
        else:
            offset = 24
            reg = r12

        ret += f"movq {r14}, 24({r13})\n"
        ret += f"movq {r13}, {offset}({reg})"

    # String
    elif isinstance(exp, StringObj):
        ret += f"{cgen(Expression(exp.in_class, 0, 'String'))}\n"
        ret += "FIXIXIFSFJONFD" # TODO: FIX


    # True exp
    elif isinstance(exp, Bool):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Bool'))}\n"
        ret += "FINISH" # TODO FINISH


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


    # ***** EXPRESSION BASE CLASS *****
        # Expression base class
    elif isinstance(exp, Expression):
        if exp.type_of in ["Bool", "Int", "String"]:
            ret += f"## new {exp.type_of}\n"
            ret += f"pushq {rbp}\n"
            ret += f"pushq {r12}\n"
            ret += f"movq ${exp.type_of}..new, {r14}\n"
            ret += f"call *{r14}\n"
            ret += f"popq {r12}\n"
            ret += f"popq {rbp}"

    return ret


def print_vtables():
    '''
    Print program vtables
    '''
    str_num = 1
    ret = "\t\t\t## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    for key, val in config.impl_map.iterables():
        ret += f".globl {key}..vtable\n"

        tmp = f"{key}..vtable:"
        ret += f"{tmp:24}## virtual function table for {key}\n"
        ret += f"\t\t\t.quad string{str_num}\n"
        ret += f"\t\t\t.quad {key}..new\n"

        cur_offset = 2

        for method in val:
            ret += f"\t\t\t.quad {method.method_class}.{method.method_name}\n"
            config.vtable_map.set_offset(key, method, cur_offset)
            cur_offset += 1

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
        config.str_num_contents[len(config.str_num_contents) + 1] = key

    config.class_tags.assemble_dicts(class_names)


    for key, val in config.class_map.iterables():
        ret += f".globl {key}..new\n"
        tmp = f"{key}..new:"
        ret += f"{tmp:24}## constructor for {key}\n"

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
            cur_offset = 3
            for attr in val:
                ret += f"## self[{cur_offset}] holds field {attr.identifier} ({attr.typename})\n"

                ret += f"{cgen(attr)}\n"

                ret += f"movq {r13}, {r12.pwo()}\n"
                config.attr_map.set_offset(key, attr, cur_offset) # TODO: Not needed. Is a bit redundant
                config.symbol_table.add(key, attr.identifier.name, cur_offset, r12)

                r12.update_offset(r12.offset + 8)
                cur_offset += 1


        self_offset = 3
        for attr in val:
            ret += f"## self[{self_offset}] {attr.identifier} initializer "
            if not attr.expr:
                ret += "-- none\n"
            else:
                ret += f"<- {attr.expr.value}\n"
                ret += f"{cgen(attr.expr, attr.identifier.name)}\n"
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
