'''
This file has all assembly logic
'''

from collections import defaultdict
import heapq as hq
import math
import config
from config import SPC
from memory import RSP, RBP, RSI, RDI, RNum, RXX, EDI
from tree import *
import built_ins

rsp = RSP()
rbp = RBP()
rsi = RSI()
rdi = RDI()

rax = RXX('a')

r12 = RNum(12)
r13 = RNum(13)
r14 = RNum(14)
r15 = RNum(15)

edi = EDI()

def cgen(exp):
    '''
    Code generation
    Recursively defined
    '''

    ret = ""

    # ***** ATTRIBUTES *****
    if isinstance(exp, Attribute): # TODO: Def a better way to do this
        if exp.identifier.name == "(raw content)":
            obj = "0" if exp.typename.name == "Int" else "the.empty.string"
            ret += f"{SPC}movq ${obj}, {r13}"

        else:
            if exp.typename.name in ["Bool", "Int", "String"]:
                return cgen(Expression(exp.in_class, 0, exp.typename.name))
            else: # i.e. is an identifier
                ret += f"{SPC}movq $0, {r13}"

    # ***** EXPRESSION TERMINALS *****

    # Int
    elif isinstance(exp, Integer):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Int'))}"
        if exp.value is not None:
            ret += "\n"
            ret += f"{SPC}movq ${exp.value}, {r14}\n"
            ret += f"{SPC}movq {r14}, 24({r13})"

    # String
    elif isinstance(exp, StringObj):
        ret += f"{cgen(Expression(exp.in_class, 0, 'String'))}\n"

        if not exp.value:
            ret += f"{SPC}movq $the.empty.string, {r15}\n"
            ret += f"{SPC}movq {r15}, 24({r13})"

            return ret


        if exp.value not in config.string_tag.vals():
            config.string_tag.add(exp.value)

        str_num = config.string_tag.get_num(exp.value)

        ret += f"{SPC}## string{str_num} holds \"{exp.value}\"\n"
        ret += f"{SPC}movq $string{str_num}, {r14}\n"
        ret += f"{SPC}movq {r14}, 24({r13})"

    # True exp
    elif isinstance(exp, Bool):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Bool'))}"
        if exp.value == "true":
            ret += "\n"
            ret += f"{SPC}movq $1, {r14}\n"
            ret += f"{SPC}movq {r14}, 24({r13})"

    # Identifier exp
    elif isinstance(exp, IdentifierExp):
        ret += f"{SPC}## {exp.exp_print()}\n"
        cur_class = exp.in_class
        id_name = exp.identifier.name
        tpl = config.symbol_table.top(cur_class, id_name)
        offset = tpl[0]
        reg = tpl[1]

        ret += f"{SPC}movq {offset * config.OFFSET_AMT}({reg}), {r13}" # TODO: DIFF FOR EACH EXPR TYPE


    # Identifier
    elif isinstance(exp, Identifier):
        ret += f"{SPC}## {exp.name}"


    # ***** EXPRESSION UNARY OPS *****

    # IsVoid
    elif isinstance(exp, IsVoid):
        ret += f"{cgen(exp.rhs)}\n"

        true_branch = config.jump_table.get()
        false_branch = true_branch + 1
        end_branch = false_branch + 1
        config.jump_table.increment(3)

        ret += f"{SPC}cmpq $0, {r13}\n"
        ret += f"{SPC}je l{true_branch}\n"

        # Handle false
        branch_details = f"l{false_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## false branch of isvoid\n"
        ret += f"{cgen(Bool(None, 0, 'false'))}\n"
        ret += f"{SPC}jmp l{end_branch}\n"

        # Handle true
        branch_details = f"l{true_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## true branch of isvoid\n"
        ret += f"{cgen(Bool(None, 0, 'true'))}\n"

        # End
        branch_details = f"l{end_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## end of isvoid"

    # Negate
    elif isinstance(exp, Negate):
        lhs = Integer(None, 0, "Int", 0)
        sub_node = Minus(exp.in_class, 0, "Int", lhs, exp.rhs)

        ret += f"{cgen(sub_node)}"


    # Not
    elif isinstance(exp, NotExpr):
        true_branch = config.jump_table.get()
        false_branch = true_branch + 1
        end_branch = true_branch + 2
        config.jump_table.increment(3)

        ret += f"{cgen(exp.rhs)}\n"
        ret += f"movq 24({r13}), {r13}\n"
        ret += f"cmpq $0, {r13}\n"
        ret += f"jne l{true_branch}\n"

        # False branch
        branch_info = f"l{false_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## false branch\n"
        ret += f"{cgen(exp.rhs)}\n"
        ret += f"jmp l{end_branch}\n"

        # True branch
        branch_info = f"l{true_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## true branch\n"
        ret += f"{cgen(Bool(exp.in_class, 0, 'false'))}\n"

        # End branch
        branch_info = f"l{end_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## end of if conditional"

    # New
    elif isinstance(exp, NewExp):
        ret += f"## new {exp.rhs.name}\n"
        ret += f"pushq {rbp}\n"
        ret += f"pushq {r12}\n"
        ret += f"movq ${exp.rhs.name}..new, {r14}\n"
        ret += f"call *{r14}\n"
        ret += f"popq {r12}\n"
        ret += f"popq {rbp}"


    # Assignment
    elif isinstance(exp, Assign):
        ret += f"{cgen(exp.rhs)}\n"

        offset = None
        reg = None

        if exp.type_of in ["Bool", "Int", "String"]:
            offset = 24
            reg = r12
        else:
            tpl = config.symbol_table.top(exp.in_class, exp.var.name)
            offset = tpl[0] * config.OFFSET_AMT
            reg = tpl[1]

        ret += f"movq {r13}, {offset}({reg})"


    # ***** EXPRESSION BINARY OPS *****

    # Plus
    elif isinstance(exp, Plus):
        ret += f"{cgen(exp.lhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {r13}, 0({rbp})\n"

        ret += f"{cgen(exp.rhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq 0({rbp}), {r14}\n"

        ret += f"addq {r14}, {r13}\n"
        ret += f"movq {r13}, 0({rbp})\n"

        ret += f"{cgen(Integer(exp.in_class, 0, 'Int', None))}\n"
        ret += f"movq 0({rbp}), {r14}\n"
        ret += f"movq {r14}, 24({r13})"


    # Minus
    elif isinstance(exp, Minus):
        ret += f"{cgen(exp.lhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {r13}, 0({rbp})\n"

        ret += f"{cgen(exp.rhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq 0({rbp}), {r14}\n"
        ret += f"movq {r14}, {rax}\n"
        ret += f"subq {r13}, {rax}\n"
        ret += f"movq {rax}, {r13}\n"
        ret += f"movq {r13}, 0({rbp})\n"

        ret += f"{cgen(Integer(exp.in_class, 0, 'Int', None))}\n"
        ret += f"movq 0({rbp}), {r14}\n"
        ret += f"movq {r14}, 24({r13})"


    # Times
    elif isinstance(exp, Times):
        pass


    # Divide
    elif isinstance(exp, Divide):
        pass


    elif isinstance(exp, (Less, LessOrEqual, Equals)):
        ret += f"pushq {r12}\n"
        ret += f"pushq {rbp}\n"
        ret += f"{cgen(exp.lhs)}\n"
        ret += f"pushq {r13}\n"
        ret += f"{cgen(exp.rhs)}\n"
        ret += f"pushq {r13}\n"

        ret += f"pushq {r12}\n"

        match exp:
            case Less():
                ret += "call lt_handler\n"
            case LessOrEqual():
                ret += "call le_handler\n"
            case Equals():
                ret += "call eq_handler\n"

        # Hardcoded 24
        ret += f"addq $24, {rsp}\n"
        ret += f"popq {rbp}\n"
        ret += f"popq {r12}"


    # ***** EXPRESSION BLOCKS *****

    # Block
    elif isinstance(exp, Block):
        for i, sub_exp in enumerate(exp.exps):
            ret += f"{cgen(sub_exp)}"
            if i < exp.num_exps - 1:
                ret += "\n"

    # If
    elif isinstance(exp, IfBlock):
        true_branch = config.jump_table.get()
        false_branch = true_branch + 1
        end_branch = false_branch + 1
        config.jump_table.increment(3)

        # Handle predicate
        ret += f"{cgen(exp.predicate)}\n"
        ret += f"{SPC}movq 24(%r13), {r13}\n"
        ret += f"{SPC}cmpq $0, {r13}\n"
        ret += f"{SPC}jne l{true_branch}\n"

        # Handle else
        branch_details = f"l{false_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## false branch\n"
        ret += f"{cgen(exp.else_body)}\n"
        ret += f"{SPC}jmp l{end_branch}\n"

        # Handle true
        branch_details = f"l{true_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## true branch\n"
        ret += f"{cgen(exp.then_body)}\n"

        # End
        branch_details = f"l{end_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## end of if conditional"


    # Loop
    elif isinstance(exp, LoopBlock):
        init_branch = config.jump_table.get()
        end_branch = init_branch + 1
        config.jump_table.increment(2)

        branch_details = f"l{init_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## while conditional check\n"

        # Predicate
        # TODO: Must be bool or identifier that rets bool
        ret += f"{cgen(exp.predicate)}\n"
        ret += f"{SPC}movq 24(%r13), {r13}\n" # TODO Identifiers must be fixed
        ret += f"{SPC}cmpq $0, {r13}\n"
        ret += f"{SPC}je l{end_branch}\n"

        # Body
        ret += f"{cgen(exp.body)}\n"
        ret += f"{SPC}jmp l{init_branch}\n"

        branch_details = f"l{end_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## end of while loop"


    # Case
    elif isinstance(exp, CaseBlock):
        num_branches = len(exp.exps) + 2
        void_branch = config.jump_table.get()
        error_branch = void_branch + num_branches - 1
        end_branch = error_branch + 1
        config.jump_table.increment(num_branches + 1)


        ret += "{SPC}## case expression begins\n"
        ret += f"{cgen(exp.case_exp)}\n"

        ret += f"{SPC}cmpq $0, {r13}\n" # Check void
        ret += f"{SPC}je l{void_branch}\n"
        ret += f"{SPC}movq {r13}, 0({rbp})\n"
        ret += f"{SPC}movq 0({r13}), {r13}\n" # TODO ??

        valid_branches = defaultdict(int)
        for i, case_expr in enumerate(exp.exps):
            num = i + void_branch + 1
            identifier = case_expr[0]
            id_type = case_expr[1]
            exp_rem = case_expr[2]

            ret += f"{SPC}## case {id_type} will jump to l{num}\n"
            valid_branches[id_type.name] = num

        ret += "{SPC}## case expression: compare type tags\n"
        cls_map = alpha_sort()
        for cls, val in cls_map:
            ret += f"{SPC}movq ${val}, {r14}\n"
            ret += f"{SPC}cmpq {r14}, {r13}\n"
            if cls in valid_branches.keys():
                ret += f"{SPC}je l{valid_branches[cls]}\n"
            else:
                ret += f"{SPC}je l{error_branch}\n"

        # ERROR BRANCH
        config.string_tag.add(built_ins.CASE_BRANCH_ERROR)

        branch_info = f"l{error_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## case expression: error case\n"

        str_tag = f"string{config.string_tag.get_num(built_ins.CASE_BRANCH_ERROR)}"

        ret += f"{SPC}movq ${str_tag}, {r13}\n"
        ret += f"{SPC}movq {r13}, {rdi}\n"
        ret += f"{SPC}call cooloutstr\n"
        ret += f"{SPC}movl $0, {edi}\n"
        ret += f"{SPC}call exit\n"

        # VOID BRANCH
        config.string_tag.add(built_ins.CASE_VOID_ERROR)

        branch_info = f"l{void_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## case expression: void case\n"

        str_tag = f"string{config.string_tag.get_num(built_ins.CASE_VOID_ERROR)}"

        ret += f"{SPC}movq ${str_tag}, {r13}\n"
        ret += f"{SPC}movq {r13}, {rdi}\n"
        ret += f"{SPC}call cooloutstr\n"
        ret += f"{SPC}movl $0, {edi}\n"
        ret += f"{SPC}call exit\n"
        ret += f"{SPC}## case expression: branches\n"

        # Branches
        for i, case_expr in enumerate(exp.exps):
            identifier = case_expr[0]
            id_type = case_expr[1]
            exp_rem = case_expr[2]
            num = i + void_branch + 1

            branch_info = f"l{num}"
            ret += f".globl {branch_info}\n"
            branch_info += ":"
            ret += f"{branch_info:24}## fp[0] holds case {identifier.name} ({id_type})\n"

            cgen(identifier)
            ret += f"{cgen(exp_rem)}\n"
            ret += f"{SPC}jmp l{end_branch}\n"

        branch_info = f"l{end_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## case expression ends"


    # Let
    elif isinstance(exp, Let):
        cur_class = exp.in_class
        cur_offset = 0
        for formal in exp.let_list:
            identifier = formal[1]
            id_type = formal[2]
            expr_type = formal[3]

            ret += f"{SPC}## fp[{cur_offset}] holds local {identifier} ({id_type})\n"

            config.symbol_table.add(cur_class, identifier.name, cur_offset, rbp)

            if not expr_type:
                match id_type.name:
                    case "Bool":
                        expr_type = Bool(cur_class, 0, None)
                    case "Int":
                        expr_type = Integer(cur_class, 0, "Int", None)
                    case "String":
                        expr_type = StringObj(cur_class, 0, "String", None)
                    case _:
                        ret += f"{SPC}movq $0, {r13}\n"
                        #expr_type = Identifier(cur_class, 0, id_type.name)
            if expr_type:
                ret += f"{cgen(expr_type)}\n"
            ret += f"{SPC}movq {r13}, {cur_offset * config.OFFSET_AMT}({rbp})\n"

            cur_offset -= 1

            config.dynamic.increment()

        ret += cgen(exp.let_body)

        for formal in exp.let_list:
            identifier = formal[1].name
            id_type = formal[2]
            expr_type = formal[3]

            config.symbol_table.pop(cur_class, identifier)


    # ***** EXPRESSION DISPATCHES *****

    # Static
    elif isinstance(exp, StaticDispatch):
        method_branch = config.jump_table.get()
        config.jump_table.increment()
        branch_info = f"l{method_branch}"

        config.string_tag.add(built_ins.STATIC_DISPATCH_ERROR)
        offset = config.vtable_map.get_offset(exp.typename.name, exp.method_name.name)
        err_tag = f"string{config.string_tag.get_num(built_ins.STATIC_DISPATCH_ERROR)}"

        ret += f"{SPC}## {exp.exp_print()}\n"
        ret += f"{SPC}pushq {r12}\n"
        ret += f"{SPC}pushq {rbp}\n"

        ret += f"{cgen(exp.obj_name)}\n"

        ret += f"{SPC}cmpq $0, {r13}\n"
        ret += f"{SPC}jne {branch_info}\n"
        ret += f"{SPC}movq ${err_tag}, {r13}\n"
        ret += f"{SPC}movq {r13}, {rdi}\n"
        ret += f"{SPC}call cooloutstr\n"
        ret += f"{SPC}movl $0, {edi}\n"
        ret += f"{SPC}call exit\n"

        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}pushq {r13}\n"

        ret += f"{SPC}## obtain vtable for class {exp.typename.name}\n"
        ret += f"{SPC}movq ${exp.typename.name}..vtable, {r14}\n"
        ret += f"{SPC}## look up {exp.method_name}() at offset {offset} in vtable\n"
        ret += f"{SPC}movq {offset * config.OFFSET_AMT}({r14}), {r14}\n"
        ret += f"{SPC}call *{r14}\n"
        # TODO: Hardcoded 8
        ret += f"{SPC}addq $8, {rsp}\n"
        ret += f"{SPC}popq {rbp}\n"
        ret += f"{SPC}popq {r12}"


    # Self
    elif isinstance(exp, SelfDispatch):
        method_name = exp.method_name.name
        ret += f"{SPC}## {method_name}(...)\n"
        ret += f"{SPC}pushq {r12}\n"
        ret += f"{SPC}pushq {rbp}\n"
        # TODO: Need to figure out why this is needed
        if method_name in ["in_string", "in_int"]:
            ret += f"{SPC}pushq {r12}\n"

        for formal in exp.formals:
            ret += f"{cgen(formal)}\n"
            ret += f"{SPC}pushq {r13}\n"
            ret += f"{SPC}pushq {r12}\n"

        ret += f"## obtain vtable for self object of type {exp.in_class}\n"
        vt_met = config.vtable_map.get_class(exp.in_class, method_name)
        cur_size = config.OFFSET_AMT

        # TODO: WRONG
        if vt_met in ["IO"]:
            cur_size *= config.obj_size.get(exp.in_class, exp.type_of)
        else:
            cur_size *= config.obj_size.get(exp.in_class, exp.in_class)

        ret += f"{SPC}movq 16({r12}), {r14}\n" # TODO: less hard-coded
        method_offset = config.vtable_map.get_offset(exp.in_class, exp.method_name.name)
        ret += f"{SPC}## look up {exp.method_name}() at offset {method_offset} in vtable\n"
        ret += f"{SPC}movq {method_offset * config.OFFSET_AMT}({r14}), {r14}\n"
        ret += f"{SPC}call *{r14}\n"
        ret += f"{SPC}addq ${cur_size}, {rsp}\n"
        ret += f"{SPC}popq {rbp}\n"
        ret += f"{SPC}popq {r12}"

    # Dynamic
    elif isinstance(exp, DynamicDispatch):
        met_branch = config.jump_table.get()
        config.jump_table.increment()

        config.string_tag.add(built_ins.DYNAMIC_DISPATCH_ERROR)
        ret += f"{SPC}## {exp.obj_name.exp_print()}.{exp.method_name}(...)\n"
        ret += f"{SPC}pushq {r12}\n"
        ret += f"{SPC}pushq {rbp}\n"
        for formal in exp.formals:
            # If ID, have to check symbol table
            # Else, call cgen on
            if isinstance(formal, IdentifierExp):
                cur_class = formal.in_class
                id_name = formal.name

                tpl = config.symbol_table.get(cur_class, id_name)
                offset = tpl[0]
                reg = tpl[1]

                ret += f"{offset * config.OFFSET_AMT}({reg}) holds {id_name} ({id_name.type_of})\n"

            else:
                ret += f"{cgen(formal)}\n"
        ret += f"{cgen(exp.obj_name)}\n"

        # Check for error
        error_tag = f"string{config.string_tag.get_num(built_ins.DYNAMIC_DISPATCH_ERROR)}"
        ret += f"{SPC}cmpq $0, {r13}\n"
        ret += f"{SPC}jne l{met_branch}\n"
        ret += f"{SPC}movq ${error_tag}, {r13}\n"
        ret += f"{SPC}movq {r13}, {rdi}\n"
        ret += f"{SPC}call cooloutstr\n"
        ret += f"{SPC}movl $0, {edi}\n"
        ret += f"{SPC}call exit\n"

        branch_info = f"l{met_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}pushq {r13}\n"

        # TODO: What is r1
        ret += f"{SPC}## obtain vtable from object in r1 with static type {exp.obj_name.type_of}\n"

        # TODO: Hardcoded 16
        ret += f"{SPC}movq 16({r13}), {r14}\n"

        method_offset = config.vtable_map.get_offset(exp.obj_name.type_of, exp.method_name.name)
        offset = method_offset * config.OFFSET_AMT

        ret += f"{SPC}## look up {exp.method_name.name}() at offset {method_offset} in vtable\n"
        ret += f"{SPC}movq {offset}({r14}), {r14}\n"
        ret += f"{SPC}call *{r14}\n"
        # TODO: Hardcoded 8
        ret += f"{SPC}addq $8, {rsp}\n"
        ret += f"{SPC}popq {rbp}\n"
        ret += f"{SPC}popq {r12}"


    # ***** EXPRESSION BASE CLASS *****
        # Expression base class
    elif isinstance(exp, Expression):
        if exp.type_of in ["Bool", "Int", "String"]:
            ret += f"{SPC}## new {exp.type_of}\n"
            ret += f"{SPC}pushq {rbp}\n"
            ret += f"{SPC}pushq {r12}\n"
            ret += f"{SPC}movq ${exp.type_of}..new, {r14}\n"
            ret += f"{SPC}call *{r14}\n"
            ret += f"{SPC}popq {r12}\n"
            ret += f"{SPC}popq {rbp}"

    return ret


def print_vtables():
    '''
    Print program vtables
    '''
    assemble_orig_vtable()

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
            ret += f"\t\t\t.quad {method.in_class}.{method.identifier}\n"
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
        config.string_tag.add(key)

    config.class_tags.assemble_dicts(class_names)


    for key, val in config.class_map.iterables():
        ret += f".globl {key}..new\n"
        tmp = f"{key}..new:"
        ret += f"{tmp:24}## constructor for {key}\n"

        ret += f"{SPC}pushq {rbp}\n"
        ret += f"{SPC}movq {rsp}, {rbp}\n"

        cur_size = max(math.ceil(len(val) / config.OFFSET_AMT), 1)
        config.obj_size.set(key, cur_size)

        ret += f"{SPC}## stack room for temporaries: {cur_size}\n"
        ret += f"{SPC}movq ${cur_size * config.OFFSET_AMT}, {r14}\n"
        ret += f"{SPC}subq {r14}, {rsp}\n"

        ret += f"{SPC}## return address handling\n"
        ret += f"{SPC}movq ${3 + len(val)}, {r12}\n"
        ret += f"{SPC}movq $8, {rsi}\n"
        ret += f"{SPC}movq {r12}, {rdi}\n"
        ret += f"{SPC}call calloc\n"
        ret += f"{SPC}movq {rax}, {r12}\n"

        ret += f"{SPC}## store class tag, object size and vtable pointer\n"

        # Class tag
        r12.update_offset(0)
        ret += f"{SPC}movq ${config.class_tags.get_tag(key)}, {r14}\n"
        ret += f"{SPC}movq {r14}, {r12.pwo()}\n"

        r12.update_offset(8)

        # Object size
        ret += f"{SPC}movq ${3 + len(val)}, {r14}\n"
        ret += f"{SPC}movq {r14}, {r12.pwo()}\n"
        r12.update_offset(16)

        # Vtable
        # TODO: Don't include vtable if DNE?
        ret += f"{SPC}movq ${key}..vtable, {r14}\n"
        ret += f"{SPC}movq {r14}, {r12.pwo()}\n"
        r12.update_offset(24)

        if len(val) != 0:
            ret += f"{SPC}## initialize attributes\n"
            cur_offset = 3
            for attr in val:
                ret += f"{SPC}## self[{cur_offset}] holds field {attr.identifier} ({attr.typename})\n"

                ret += f"{cgen(attr)}\n"

                ret += f"{SPC}movq {r13}, {r12.pwo()}\n"
                config.attr_map.set_offset(key, attr, cur_offset) # TODO: Not needed. Is a bit redundant
                config.symbol_table.add(key, attr.identifier.name, cur_offset, r12)

                r12.update_offset(r12.offset + 8)
                cur_offset += 1


        self_offset = 3
        for attr in val:
            ret += f"{SPC}## self[{self_offset}] {attr.identifier} initializer "
            if not attr.expr:
                ret += "-- none\n"
            else:
                if isinstance(attr.expr, StringObj):
                    ret += f"<- \"{attr.expr.value}\"\n"
                else:
                    ret += f"<- {attr.expr.exp_print()}\n"
                ret += f"{cgen(attr.expr)}\n"
                tpl = config.symbol_table.top(key, attr.identifier.name)
                offset = tpl[0] * config.OFFSET_AMT
                reg = tpl[1]
                ret += f"{SPC}movq {r13}, {offset}({reg})\n"
            self_offset += 1

            r12.update_offset()

        ret += f"{SPC}movq {r12}, {r13}\n"
        ret += f"{SPC}## return address handling\n"
        ret += f"{SPC}movq {rbp}, {rsp}\n"
        ret += f"{SPC}popq {rbp}\n"
        ret += f"{SPC}ret\n"
        ret += f"{SPC}## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    return ret


def print_methods():
    '''
    Prints global methods
    '''

    ordering = top_sort()

    ret = ""

    for cls in ordering:
        class_name = cls.class_info.name
        if class_name == "IO":
            ret += f"{built_ins.io_in_int()}\n{built_ins.io_in_string()}\n"
            ret += f"{built_ins.io_out_int()}\n{built_ins.io_out_string()}\n"
            continue
        elif class_name == "Object":
            config.string_tag.add(built_ins.ABORT_STR)
            ret += f"{built_ins.obj_abort()}\n{built_ins.obj_copy()}\n"
            ret += f"{built_ins.obj_type_name()}\n"
            continue
        elif class_name == "String":
            config.string_tag.add(built_ins.SUBSTR_ERROR)
            ret += f"{built_ins.str_concat()}\n{built_ins.str_length()}\n"
            ret += f"{built_ins.str_substr()}\n"
            continue

        for feature in cls.feature_list:
            if not isinstance(feature, Method):
                continue
            method_info = f"{class_name}.{feature.identifier.name}"

            ret += f".globl {method_info}\n"
            temp = method_info + ":"
            ret += f"{temp:24}## method definition\n" #TODO SPACING
            ret += f"{SPC}pushq {rbp}\n"
            ret += f"{SPC}movq {rsp}, {rbp}\n"
            # TODO: Where does this 16 come from?
            ret += f"{SPC}movq 16({rbp}), {r12}\n"

            num_formals = feature.formals_list[0]

            config.dynamic.reset()

            tmp = ""
            for val in config.class_map.class_iterables(class_name):
                val_name = val.identifier.name
                val_type = val.typename.name
                val_offset = config.attr_map.get_offset(class_name, val_name)
                tmp += f"{SPC}## self[{val_offset}] holds field {val_name} ({val_type})\n"

            cur_offset = num_formals + 2

            for formal in feature.formals_list:
                if isinstance(formal, int):
                    continue
                tmp += f"{SPC}## fp[{cur_offset}] holds argument {formal[0]} ({formal[1]})\n"

                id_name = formal[0].name
                config.symbol_table.add(class_name, id_name, cur_offset, rbp)

                cur_offset -= 1

            tmp += f"{SPC}## method body begins\n"
            tmp += f"{cgen(feature.body)}\n"
            offset = len(config.dynamic) + 1
            ret += f"{SPC}## stack room for temporaries: {offset}\n"
            ret += f"{SPC}movq ${offset * config.OFFSET_AMT}, {r14}\n"
            ret += f"{SPC}subq {r14}, {rsp}\n"
            ret += f"{SPC}## return address handling\n"

            ret += tmp


            ret += f".globl {method_info}.end\n"
            temp = method_info + ".end:"
            ret += f"{temp:24}## method body ends\n"
            ret += f"{SPC}## return address handling\n"

            ret += f"{SPC}movq {rbp}, {rsp}\n"
            ret += f"{SPC}popq {rbp}\n"
            ret += f"{SPC}ret\n"
            ret += f"{SPC}## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

            for formal in feature.formals_list:
                if isinstance(formal, int):
                    continue

                id_name = formal[0].name
                config.symbol_table.pop(class_name, id_name)

    return ret


def print_cool_globals():
    '''
    Prints cool globals
    '''

    # config.string_tag.add(constant_prints.VOID_ERROR) # TODO: WHERE TO USE???

    ret = ""
    ret += f"{SPC}## global string constants\n"
    ret += f"{built_ins.str_start()}\n"

    sorted_strs = config.string_tag.pairs()

    for cur_str in sorted_strs:
        ret += f".globl {cur_str[0]}\n"
        temp = cur_str[0] + ":"
        if "\\n" in cur_str[1]:
            tmp_str = cur_str[1][:len(cur_str[1])-2] + "\\\\n"
            ret += f"{temp:24}# \"{tmp_str}\"\n"
        else:
            ret += f"{temp:24}# \"{cur_str[1]}\"\n"
        for ch in cur_str[1]:
            if ch == "\"":
                continue
            elif ch == "\\":
                ret += f".byte {ord(ch):>3} # '{ch}{ch}'\n"
            else:
                ret += f".byte {ord(ch):>3} # '{ch}'\n"
        ret += ".byte 0\n\n"

    ret += f"{built_ins.program_info()}\n"

    return ret

def assemble_orig_vtable():
    '''
    Assembles map of cur_class -> method -> orig class
    '''
    base_classes = get_base_classes()
    classes = config.aast.copy()
    classes.pop(0)

    name_to_obj = defaultdict(ClassObj)

    for cls in base_classes:
        classes.append(cls)

    for cls in classes:
        class_name = cls.class_info.name
        name_to_obj[class_name] = cls

    stk = []
    for cls in classes:
        orig_cls = cls.class_info.name
        stk.append(cls)

        cur = cls.parent
        while cur:
            cur = cur.name
            cur = name_to_obj[cur]
            stk.append(cur)
            cur = cur.parent

        # TODO: lol
        if not cls.parent and orig_cls != "Object":
            stk.append(name_to_obj["Object"])
        if orig_cls == "Main":
            stk.append(name_to_obj["IO"])


        while len(stk) != 0:
            top = stk.pop()
            cls_name = top.class_info.name

            for feature in top.feature_list:
                if isinstance(feature, Method):
                    method_name = feature.identifier.name
                    config.vtable_map.set_class(orig_cls, method_name, cls_name)


def alpha_sort():
    '''
    Sorts ClasseMap in alphabetical order
    Return dictionary of class name to ClassObj
    '''

    cls_map = []
    for key, _ in config.class_map.iterables():
        cls_map.append((key, config.class_tags.get_tag(key)))

    return sorted(cls_map, key=lambda x: x[0])


def top_sort():
    '''
    REPLACE TODO
    '''
    base_classes = get_base_classes()

    classes = config.aast.copy()
    classes.pop(0)
    for cls in base_classes:
        classes.append(cls)

    return helper(classes)


def helper(classes):
    '''
    Helper for toposort. TODO Clean this up
    '''
    incoming_edges = defaultdict(int)
    graph = defaultdict(list)
    name_to_obj = defaultdict(ClassObj)

    for cls in classes:
        class_name = cls.class_info.name
        name_to_obj[class_name] = cls
        incoming_edges[class_name] = 0

    for cls in classes:
        class_name = cls.class_info.name
        if class_name not in graph:
            graph[class_name] = []

        if class_name == "Main": # TODO: What if main inherits from another class?
            graph["IO"].append(class_name)
            graph["Object"].append(class_name)
            incoming_edges[class_name] += 2
        elif class_name == "Object":
            continue

        parent = "Object" if not cls.parent else cls.parent.name
        if class_name not in graph[parent]:
            graph[parent].append(class_name)
            incoming_edges[class_name] += 1

    queue = []
    for key, val in incoming_edges.items():
        if val == 0:
            hq.heappush(queue, key)

    toposort = []

    while len(queue) != 0:
        name = hq.heappop(queue)
        toposort.append(name)

        for neighbor in graph[name]:
            incoming_edges[neighbor] -= 1
            if incoming_edges[neighbor] == 0:
                hq.heappush(queue, neighbor)

    for key, val in incoming_edges.items():
        if not val == 0:
            print("ERROR")
            exit(1)

    ret = []

    for class_name in toposort:
        ret.append(name_to_obj[class_name])

    return ret


def get_base_classes():
    '''
    Assembles the base classes
    '''

    abort_method = Method("Object", \
                   Identifier("Object", 0, "abort"),\
                   [0], \
                   Identifier("Object", 0, "Object"),
                   None)
    copy_method = Method("Object", \
                   Identifier("Object", 0, "copy"),\
                   [0], \
                   Identifier("Object", 0, "Object"),
                   None)
    type_name = Method("Object", \
                   Identifier("Object", 0, "type_name"),\
                   [0], \
                   Identifier("Object", 0, "Object"),
                   None)
    object_class = ClassObj(Identifier("Object", 0, "Object"), \
                      "no_inherits", \
                      None, \
                      [abort_method, copy_method, type_name]
                      )
    # Object: Methods: abort, copy, typename

    in_int = Method("IO", \
                   Identifier("IO", 0, "in_int"),\
                   [0], \
                   Identifier("IO", 0, "Int"),
                   None)
    in_string = Method("IO", \
                   Identifier("IO", 0, "in_string"),\
                   [0], \
                   Identifier("IO", 0, "String"),
                   None)
    out_int = Method("IO", \
                   Identifier("IO", 0, "out_int"),\
                   [1, (Identifier("IO", 0, "x"), Identifier("IO", 0, "Int"))], \
                   Identifier("IO", 0, "Object"),
                   None)

    out_string = Method("IO", \
                   Identifier("IO", 0, "out_string"),\
                   [1, (Identifier("IO", 0, "x"), Identifier("IO", 0, "String"))], \
                   Identifier("IO", 0, "SELF_TYPE"),
                   None)

    io_class = ClassObj(Identifier("IO", 0, "IO"), \
                      "inherits", \
                      Identifier("IO", 0, "Object"), \
                      [in_int, in_string, out_int, out_string]
                      )

    # IO: In int, in string, out int, out string

    concat = Method("String", \
        Identifier("IO", 0, "concat"),\
        [1, (Identifier("String", 0, "s"), Identifier("String", 0, "String"))], \
        Identifier("String", 0, "String"),
        None)

    length = Method("String", \
        Identifier("IO", 0, "length"),\
        [1, (Identifier("String", 0, "s"), Identifier("String", 0, "String"))], \
        Identifier("String", 0, "String"),
        None)

    substr = Method("String", \
        Identifier("IO", 0, "substr"),\
        [2, (Identifier("String", 0, "i"), Identifier("String", 0, "Int")), \
        (Identifier("String", 0, "l"), Identifier("String", 0, "Int"))], \
        Identifier("String", 0, "String"), \
        None)

    str_class = ClassObj(Identifier("String", 0, "String"), \
        "inherits", \
        Identifier("IO", 0, "Object"), \
        [concat, length, substr]
        )

    return [object_class, io_class, str_class]
