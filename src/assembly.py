'''
This file has all assembly logic
'''

from collections import defaultdict
import heapq as hq
import math
import config
from config import SPC
from memory import RSP, RBP, RSI, RDI, RNum, RXX, EDI, R13D, EAX
from tree import *
import built_ins

rsp = RSP()
rbp = RBP()
rsi = RSI()
rdi = RDI()

rax = RXX('a')
rdx = RXX('d')

r12 = RNum(12)
r13 = RNum(13)
r14 = RNum(14)
r15 = RNum(15)

edi = EDI()
eax = EAX()
r13d = R13D()

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
            ret += f"movq ${obj}, {r13}"

        else:
            if exp.typename.name in ["Bool", "Int", "String"]:
                ret += cgen(Expression(exp.in_class, 0, exp.typename.name))
            else:
                ret += f"movq $0, {r13}"

    # ***** EXPRESSION TERMINALS *****

    # Int
    elif isinstance(exp, Integer):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Int'))}"
        if exp.value is not None:
            ret += "\n"
            ret += f"movq ${exp.value}, {r14}\n"
            ret += f"movq {r14}, 24({r13})"

    # String
    elif isinstance(exp, StringObj):
        ret += f"{cgen(Expression(exp.in_class, 0, 'String'))}\n"

        if exp.value is None:
            ret += f"movq $the.empty.string, {r15}\n"
            ret += f"movq {r15}, 24({r13})"

            return ret

        if exp.value not in config.string_tag.vals():
            config.string_tag.add(exp.value)

        str_num = config.string_tag.get_num(exp.value)

        ret += f"## string{str_num} holds \"{exp.value}\"\n"
        ret += f"movq $string{str_num}, {r14}\n"
        ret += f"movq {r14}, 24({r13})"

    # True exp
    elif isinstance(exp, Bool):
        ret += f"{cgen(Expression(exp.in_class, 0, 'Bool'))}"
        if exp.value == "true":
            ret += "\n"
            ret += f"movq $1, {r14}\n"
            ret += f"movq {r14}, 24({r13})"

    # Identifier exp
    elif isinstance(exp, IdentifierExp):
        # TODO ???
        if exp.identifier.name == "self":
            return f"movq {r12}, {r13}"
        ret += f"## {exp.exp_print()}\n"
        cur_class = exp.in_class
        id_name = exp.identifier.name
        tpl = config.symbol_table.top(cur_class, id_name)
        offset = tpl[0]
        reg = tpl[1]

        ret += f"movq {offset * config.OFFSET_AMT}({reg}), {r13}" # TODO: DIFF FOR EACH EXPR TYPE


    # Identifier
    elif isinstance(exp, Identifier):
        ret += f"## {exp.name}"


    # ***** EXPRESSION UNARY OPS *****

    # IsVoid
    elif isinstance(exp, IsVoid):
        ret += f"{cgen(exp.rhs)}\n"

        true_branch = config.jump_table.get()
        false_branch = true_branch + 1
        end_branch = false_branch + 1
        config.jump_table.increment(3)

        ret += f"cmpq $0, {r13}\n"
        ret += f"je l{true_branch}\n"

        # Handle false
        branch_details = f"l{false_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## false branch of isvoid\n"
        ret += f"{cgen(Bool(None, 0, 'false'))}\n"
        ret += f"jmp l{end_branch}\n"

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

        tpl = config.symbol_table.top(exp.in_class, exp.var.name)
        offset = tpl[0] * config.OFFSET_AMT
        reg = tpl[1]

        ret += f"movq {r13}, {offset}({reg})"


    # ***** EXPRESSION BINARY OPS *****

    # Plus
    elif isinstance(exp, Plus):
        offset = config.rbp_offset.get() * config.OFFSET_AMT

        ret += f"{cgen(exp.lhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        config.rbp_offset.decrement()
        ret += f"{cgen(exp.rhs)}\n"
        config.rbp_offset.increment()

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {offset}({rbp}), {r14}\n"
        ret += f"addq {r14}, {r13}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        ret += f"{cgen(Integer(exp.in_class, 0, 'Int', None))}\n"
        ret += f"movq {offset}({rbp}), {r14}\n"
        ret += f"movq {r14}, 24({r13})"


    # Minus
    elif isinstance(exp, Minus):
        offset = config.rbp_offset.get() * config.OFFSET_AMT

        ret += f"{cgen(exp.lhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        config.rbp_offset.decrement()
        ret += f"{cgen(exp.rhs)}\n"
        config.rbp_offset.increment()

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {offset}({rbp}), {r14}\n"
        ret += f"movq {r14}, {rax}\n"
        ret += f"subq {r13}, {rax}\n"
        ret += f"movq {rax}, {r13}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        ret += f"{cgen(Integer(exp.in_class, 0, 'Int', None))}\n"

        ret += f"movq {offset}({rbp}), {r14}\n"
        ret += f"movq {r14}, 24({r13})"


    # Times
    elif isinstance(exp, Times):
        offset = config.rbp_offset.get() * config.OFFSET_AMT

        ret += f"{cgen(exp.lhs)}\n"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        config.rbp_offset.decrement()
        ret += f"{cgen(exp.rhs)}\n"
        config.rbp_offset.increment()

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {offset}({rbp}), {r14}\n\n"
        ret += f"movq {r14}, {rax}\n"
        ret += f"imull {r13d}, {eax}\n"
        ret += f"shlq $32, {rax}\n"
        ret += f"shrq $32, {rax}\n"
        ret += f"movl {eax}, {r13d}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        ret += f"{cgen(Integer(exp.in_class, 0, 'Int', None))}\n"
        ret += f"movq {offset}({rbp}), {r14}\n"
        ret += f"movq {r14}, 24({r13})"

    # Divide
    elif isinstance(exp, Divide):
        offset = config.rbp_offset.get() * config.OFFSET_AMT

        ret += f"{cgen(exp.lhs)}\n"

        # Handle error branching
        error_str = built_ins.divide_error(exp.lineno)
        config.string_tag.add(error_str)
        str_tag = f"string{config.string_tag.get_num(error_str)}"

        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {r13}, {offset}({rbp})\n"

        config.rbp_offset.decrement()
        ret += f"{cgen(exp.rhs)}\n"
        config.rbp_offset.increment()

        ret += f"movq 24({r13}), {r14}\n"

        succ_branch = config.jump_table.get()
        config.jump_table.increment()
        branch_info = f"l{succ_branch}"

        ret += f"cmpq $0, {r14}\n"
        ret += f"jne {branch_info}\n"

        # Error
        ret += f"movq ${str_tag}, {r13}\n"
        ret += f"movq {r13}, {rdi}\n"
        ret += f"call cooloutstr\n"
        ret += f"movl $0, {edi}\n"
        ret += "call exit\n"

        # Division success
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## division is OK\n"
        ret += f"movq 24({r13}), {r13}\n"
        ret += f"movq {offset}({rbp}), {r14}\n\n"

        # Division arithmetic
        ret += f"movq $0, {rdx}\n"
        ret += f"movq {r14}, {rax}\n"
        ret += "cdq\n"
        ret += f"idivl {r13d}\n" # TODO: do we need this extra reg? Prob an identifier
        ret += f"movq {rax}, {r13}\n"

        ret += f"movq {r13}, {offset}({rbp})\n"
        ret += f"{cgen(Integer(exp.in_class, 0, 'Int', None))}\n"
        ret += f"movq {offset}({rbp}), {r14}\n"
        ret += f"movq {r14}, 24({r13})"


    elif isinstance(exp, (Less, LessOrEqual, Equals)):
        ret += f"pushq {r12}\n"
        ret += f"pushq {rbp}\n"
        ret += f"{cgen(exp.lhs)}\n"
        ret += f"pushq {r13}\n"

        config.rbp_offset.decrement()
        ret += f"{cgen(exp.rhs)}\n"
        config.rbp_offset.increment()
        
        ret += f"pushq {r13}\n"
        ret += f"pushq {r12}\n"


        if isinstance(exp, Less):
            ret += "call lt_handler\n"
        elif isinstance(exp, LessOrEqual):
            ret += "call le_handler\n"
        else:
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

        # Handle predicate
        ret += f"{cgen(exp.predicate)}\n"
        ret += f"movq 24(%r13), {r13}\n"
        ret += f"cmpq $0, {r13}\n"
        true_branch = config.jump_table.get()
        ret += f"jne l{true_branch}\n"
        config.jump_table.increment()

        false_branch = true_branch + 1
        end_branch = false_branch + 1
        config.jump_table.increment(2)

        # Handle else
        branch_details = f"l{false_branch}"
        ret += f".globl {branch_details}\n"
        branch_details += ":"
        ret += f"{branch_details:24}## false branch\n"
        ret += f"{cgen(exp.else_body)}\n"
        ret += f"jmp l{end_branch}\n"

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
        ret += f"movq 24(%r13), {r13}\n" # TODO Identifiers must be fixed
        ret += f"cmpq $0, {r13}\n"
        ret += f"je l{end_branch}\n"

        # Body
        ret += f"{cgen(exp.body)}\n"
        ret += f"jmp l{init_branch}\n"

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

        ret += "## case expression begins\n"
        ret += f"{cgen(exp.case_exp)}\n"

        ret += f"cmpq $0, {r13}\n" # Check void
        ret += f"je l{void_branch}\n"
        ret += f"movq {r13}, 0({rbp})\n"
        ret += f"movq 0({r13}), {r13}\n" # TODO ??

        valid_branches = defaultdict(int)
        for i, case_expr in enumerate(exp.exps):
            num = i + void_branch + 1
            identifier = case_expr[0]
            id_type = case_expr[1]
            exp_rem = case_expr[2]

            ret += f"## case {id_type} will jump to l{num}\n"
            valid_branches[id_type.name] = num

        ret += "## case expression: compare type tags\n"
        cls_map = alpha_sort()
        for cls, val in cls_map:
            ret += f"movq ${val}, {r14}\n"
            ret += f"cmpq {r14}, {r13}\n"
            if cls in valid_branches.keys():
                ret += f"je l{valid_branches[cls]}\n"
            else:
                ret += f"je l{error_branch}\n"

        # ERROR BRANCH
        config.string_tag.add(built_ins.case_branch_error(exp.lineno))

        branch_info = f"l{error_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## case expression: error case\n"

        str_tag = f"string{config.string_tag.get_num(built_ins.case_branch_error(exp.lineno))}"

        ret += f"movq ${str_tag}, {r13}\n"
        ret += f"movq {r13}, {rdi}\n"
        ret += f"call cooloutstr\n"
        ret += f"movl $0, {edi}\n"
        ret += f"call exit\n"

        # VOID BRANCH
        config.string_tag.add(built_ins.case_void_error(exp.lineno))

        branch_info = f"l{void_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## case expression: void case\n"

        str_tag = f"string{config.string_tag.get_num(built_ins.case_void_error(exp.lineno))}"

        ret += f"movq ${str_tag}, {r13}\n"
        ret += f"movq {r13}, {rdi}\n"
        ret += f"call cooloutstr\n"
        ret += f"movl $0, {edi}\n"
        ret += f"call exit\n"
        ret += f"## case expression: branches\n"

        # Branches
        cur_offset = config.rbp_offset.get()
        for i, case_expr in enumerate(exp.exps):
            identifier = case_expr[0]
            id_type = case_expr[1]
            exp_rem = case_expr[2]
            num = i + void_branch + 1
            config.symbol_table.add(exp.in_class, identifier.name, cur_offset, rbp)

            branch_info = f"l{num}"
            ret += f".globl {branch_info}\n"
            branch_info += ":"
            ret += f"{branch_info:24}## fp[0] holds case {identifier.name} ({id_type})\n"

            cgen(identifier)
            ret += f"{cgen(exp_rem)}\n"
            ret += f"jmp l{end_branch}\n"

            config.symbol_table.pop(exp.in_class, identifier.name)

        branch_info = f"l{end_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}## case expression ends"


    # Let
    elif isinstance(exp, Let):
        cur_class = exp.in_class
        cur_offset = config.rbp_offset.get()
        for formal in exp.let_list:
            identifier = formal[1]
            id_type = formal[2]
            expr_type = formal[3]

            ret += f"## fp[{cur_offset}] holds local {identifier} ({id_type})\n"

            config.symbol_table.add(cur_class, identifier.name, cur_offset, rbp)

            if not expr_type:
                if id_type.name == "Bool":
                    expr_type = Bool(cur_class, 0, None)
                elif id_type.name == "Int":
                    expr_type = Integer(cur_class, 0, "Int", None)
                elif id_type.name == "String":
                    expr_type = StringObj(cur_class, 0, "String", None)
                else:
                    ret += f"movq $0, {r13}\n"
            if expr_type:
                ret += f"{cgen(expr_type)}\n"
            ret += f"movq {r13}, {cur_offset * config.OFFSET_AMT}({rbp})\n"

            cur_offset -= 1
            config.rbp_offset.decrement()

        ret += cgen(exp.let_body)

        for formal in exp.let_list:
            identifier = formal[1].name
            id_type = formal[2]
            expr_type = formal[3]

            config.symbol_table.pop(cur_class, identifier)

            config.rbp_offset.increment()


    # ***** EXPRESSION DISPATCHES *****

    # Static
    elif isinstance(exp, StaticDispatch):
        config.string_tag.add(built_ins.static_dispatch_error(exp.lineno))
        offset = config.vtable_map.get_offset(exp.typename.name, exp.method_name.name)
        err_tag = f"string{config.string_tag.get_num(built_ins.static_dispatch_error(exp.lineno))}"

        ret += f"## {exp.exp_print()}\n"
        ret += f"pushq {r12}\n"
        ret += f"pushq {rbp}\n"

        for formal in exp.formals:
            ret += f"{cgen(formal)}\n"
            ret += f"pushq {r13}\n"

        ret += f"{cgen(exp.obj_name)}\n"

        method_branch = config.jump_table.get()
        config.jump_table.increment()
        branch_info = f"l{method_branch}"
        ret += f"cmpq $0, {r13}\n"
        ret += f"jne {branch_info}\n"
        ret += f"movq ${err_tag}, {r13}\n"
        ret += f"movq {r13}, {rdi}\n"
        ret += f"call cooloutstr\n"
        ret += f"movl $0, {edi}\n"
        ret += f"call exit\n"

        branch_info = f"l{method_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}pushq {r13}\n"

        ret += f"## obtain vtable for class {exp.typename.name}\n"
        ret += f"movq ${exp.typename.name}..vtable, {r14}\n"
        ret += f"## look up {exp.method_name}() at offset {offset} in vtable\n"
        ret += f"movq {offset * config.OFFSET_AMT}({r14}), {r14}\n"
        ret += f"call *{r14}\n"

        # TODO Is below correct?
        stk_reset = (len(exp.formals)+1) * config.OFFSET_AMT
        ret += f"addq ${stk_reset}, {rsp}\n"
        ret += f"popq {rbp}\n"
        ret += f"popq {r12}"


    # Self
    elif isinstance(exp, SelfDispatch):
        method_name = exp.method_name.name
        ret += f"## {method_name}(...)\n"
        ret += f"pushq {r12}\n"
        ret += f"pushq {rbp}\n"

        if method_name in ["abort", "in_int", "in_string", "type_name", "copy"]:
            ret += f"pushq {r12}\n"

        for formal in exp.formals:
            ret += f"{cgen(formal)}\n"
            ret += f"pushq {r13}\n"
            ret += f"pushq {r12}\n"

        ret += f"## obtain vtable for self object of type {exp.in_class}\n"
        vt_met = config.vtable_map.get_class(exp.in_class, method_name)

        ret += f"movq 16({r12}), {r14}\n"

        method_offset = config.vtable_map.get_offset(exp.in_class, exp.method_name.name)
        ret += f"## look up {exp.method_name}() at offset {method_offset} in vtable\n"
        ret += f"movq {method_offset * config.OFFSET_AMT}({r14}), {r14}\n"
        ret += f"call *{r14}\n"

        stk_reset = (len(exp.formals)+1) * config.OFFSET_AMT
        ret += f"addq ${stk_reset}, {rsp}\n"

        ret += f"popq {rbp}\n"
        ret += f"popq {r12}"

    # Dynamic
    elif isinstance(exp, DynamicDispatch):
        ret += f"## {exp.obj_name.exp_print()}.{exp.method_name}(...)\n"
        ret += f"pushq {r12}\n"
        ret += f"pushq {rbp}\n"
        for formal in exp.formals:
            ret += f"{cgen(formal)}\n"
            ret += f"pushq {r13}\n"
        ret += f"{cgen(exp.obj_name)}\n"

        # Check for error
        met_branch = config.jump_table.get()
        config.jump_table.increment()
        config.string_tag.add(built_ins.dynamic_dispatch_error(exp.lineno))
        error_tag = f"string{config.string_tag.get_num(built_ins.dynamic_dispatch_error(exp.lineno))}"
        ret += f"cmpq $0, {r13}\n"
        ret += f"jne l{met_branch}\n"
        ret += f"movq ${error_tag}, {r13}\n"
        ret += f"movq {r13}, {rdi}\n"
        ret += f"call cooloutstr\n"
        ret += f"movl $0, {edi}\n"
        ret += f"call exit\n"

        branch_info = f"l{met_branch}"
        ret += f".globl {branch_info}\n"
        branch_info += ":"
        ret += f"{branch_info:24}pushq {r13}\n"

        # TODO: What is r1
        ret += f"## obtain vtable from object in r1 with static type {exp.obj_name.type_of}\n"

        # TODO: Hardcoded 16
        ret += f"movq 16({r13}), {r14}\n"

        tmp = exp.obj_name.type_of if exp.obj_name.type_of != "SELF_TYPE" else exp.in_class
        method_offset = config.vtable_map.get_offset(tmp, exp.method_name.name)
        offset = method_offset * config.OFFSET_AMT

        ret += f"## look up {exp.method_name.name}() at offset {method_offset} in vtable\n"
        ret += f"movq {offset}({r14}), {r14}\n"
        ret += f"call *{r14}\n"

        stk_reset = (len(exp.formals)+1) * config.OFFSET_AMT
        ret += f"addq ${stk_reset}, {rsp}\n"
        ret += f"popq {rbp}\n"
        ret += f"popq {r12}"


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
    assemble_orig_vtable()

    str_num = 1
    ret = "## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    for key, val in config.impl_map.iterables():
        ret += f".globl {key}..vtable\n"

        tmp = f"{key}..vtable:"
        ret += f"{tmp:24}## virtual function table for {key}\n"
        ret += f".quad string{str_num}\n"
        ret += f".quad {key}..new\n"

        cur_offset = 2

        for method in val:
            ret += f"\t\t\t.quad {method.in_class}.{method.identifier}\n"
            config.vtable_map.set_offset(key, method, cur_offset)
            cur_offset += 1

        ret += "## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"
        str_num += 1

    return ret


def print_ctors():
    '''
    Print program constructors
    '''
    config.rbp_offset.reset()

    ret = ""

    class_names = []
    for key, _ in config.class_map.iterables():
        class_names.append(key)
        config.string_tag.add(key)

    # TODO Needs to be removed
    config.obj_size.set("String", 2)
    config.obj_size.set("Bool", 1)
    config.obj_size.set("IO", 2)
    config.obj_size.set("Object", 1)
    config.obj_size.set("Int", 1)

    config.class_tags.assemble_dicts(class_names)

    name_to_obj = defaultdict(ClassObj)
    for cls in config.aast:
        if isinstance(cls, ClassObj):
            class_name = cls.class_info.name
            name_to_obj[class_name] = cls

    for key, val in config.class_map.iterables():
        ret += f".globl {key}..new\n"
        tmp = f"{key}..new:"
        ret += f"{tmp:24}## constructor for {key}\n"

        ret += f"pushq {rbp}\n"
        ret += f"movq {rsp}, {rbp}\n"

        tmp = ""
        if len(val) != 0:
            tmp += "## initialize attributes\n"
            cur_offset = 3
            for attr in val:
                tmp += f"## self[{cur_offset}] holds field {attr.identifier} ({attr.typename})\n"

                tmp += f"{cgen(attr)}\n"

                tmp += f"movq {r13}, {cur_offset * config.OFFSET_AMT}({r12})\n"
                config.attr_map.set_offset(key, attr, cur_offset)
                config.symbol_table.add(key, attr.identifier.name, cur_offset, r12)

                r12.update_offset(r12.offset + 8)
                cur_offset += 1

        self_offset = 3
        for attr in val:
            tmp += f"## self[{self_offset}] {attr.identifier} initializer "
            if not attr.expr:
                tmp += "-- none\n"
            else:
                if isinstance(attr.expr, StringObj):
                    tmp += f"<- \"{attr.expr.value}\"\n"
                else:
                    tmp += f"<- {attr.expr.exp_print()}\n"
                tmp += f"{cgen(attr.expr)}\n"
                tpl = config.symbol_table.top(key, attr.identifier.name)
                offset = tpl[0] * config.OFFSET_AMT
                reg = tpl[1]
                tmp += f"movq {r13}, {offset}({reg})\n"
            self_offset += 1

            r12.update_offset()

        cur_size = max(-1 * config.rbp_offset.get_min(), 1)
        config.obj_size.set(key, cur_size)

        ret += f"## stack room for temporaries: {cur_size}\n"
        ret += f"movq ${cur_size * config.OFFSET_AMT}, {r14}\n"
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
        ret += f"movq ${key}..vtable, {r14}\n"
        ret += f"movq {r14}, {r12.pwo()}\n"
        r12.update_offset(24)

        ret += tmp


        ret += f"movq {r12}, {r13}\n"
        ret += f"## return address handling\n"
        ret += f"movq {rbp}, {rsp}\n"
        ret += f"popq {rbp}\n"
        ret += f"ret\n"
        ret += f"## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    return ret


def print_methods():
    '''
    Prints global methods
    '''
    ordering = get_ordering()

    ret = ""

    for class_name, inner_dict in ordering.items():
        for method_name, tpl in inner_dict.items():
            config.rbp_offset.reset()
            if not tpl:
                continue
            orig_class = tpl[0]
            feature = tpl[1]

            # CHECK BUILT-INS
            # TODO: Put this somewhere else
            if orig_class == "IO":
                if method_name == "in_int":
                    ret += f"{built_ins.io_in_int()}\n"
                elif method_name == "in_string":
                    ret += f"{built_ins.io_in_string()}\n"
                elif method_name == "out_int":
                    ret += f"{built_ins.io_out_int()}\n"
                else:
                    ret += f"{built_ins.io_out_string()}\n"
                continue
            elif orig_class == "Object":
                if method_name == "abort":
                    config.string_tag.add(built_ins.ABORT_STR)
                    ret += f"{built_ins.obj_abort()}\n"
                elif method_name == "copy":
                    ret += f"{built_ins.obj_copy()}\n"
                else:
                    ret += f"{built_ins.obj_type_name()}\n"
                continue
            elif orig_class == "String":
                if method_name == "concat":
                    ret += f"{built_ins.str_concat()}\n"
                elif method_name == "length":
                    ret += f"{built_ins.str_length()}\n"
                else:
                    config.string_tag.add(built_ins.substr_error(0))
                    ret += f"{built_ins.str_substr()}\n"

                continue

            method_info = f"{orig_class}.{feature.identifier.name}"

            ret += f".globl {method_info}\n"
            temp = method_info + ":"
            ret += f"{temp:24}## method definition\n"
            ret += f"pushq {rbp}\n"
            ret += f"movq {rsp}, {rbp}\n"
            # TODO: Where does this 16 come from?
            ret += f"movq 16({rbp}), {r12}\n"

            num_formals = feature.formals_list[0]

            tmp = ""
            for val in config.class_map.class_iterables(class_name):
                val_name = val.identifier.name
                val_type = val.typename.name
                val_offset = config.attr_map.get_offset(class_name, val_name)
                tmp += f"## self[{val_offset}] holds field {val_name} ({val_type})\n"

            cur_offset = num_formals + 2

            for formal in feature.formals_list:
                if isinstance(formal, int):
                    continue

                tmp += f"## fp[{cur_offset}] holds argument {formal[0]} ({formal[1]})\n"

                id_name = formal[0].name
                config.symbol_table.add(formal[0].in_class, id_name, cur_offset, rbp)

                cur_offset -= 1

            tmp += f"## method body begins\n"
            tmp += f"{cgen(feature.body)}\n"
            # offset = max(config.method_map.get_method(class_name, method_name).temp, 1)
            offset = max(-1 * config.rbp_offset.get_min(), 1)

            ret += f"## stack room for temporaries: {offset}\n"
            ret += f"movq ${offset * config.OFFSET_AMT}, {r14}\n"
            ret += f"subq {r14}, {rsp}\n"
            ret += f"## return address handling\n"

            ret += tmp

            ret += f".globl {method_info}.end\n"
            temp = method_info + ".end:"
            ret += f"{temp:24}## method body ends\n"
            ret += f"## return address handling\n"

            ret += f"movq {rbp}, {rsp}\n"
            ret += f"popq {rbp}\n"
            ret += f"ret\n"
            ret += f"## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

            for formal in feature.formals_list:
                if isinstance(formal, int):
                    continue

                id_name = formal[0].name
                config.symbol_table.pop(formal[0].in_class, id_name)

    return ret


def print_cool_globals():
    '''
    Prints cool globals
    '''
    ret = ""
    ret += f"## global string constants\n"
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


def get_ordering():
    '''
    Returns the proper ordering
    '''
    base_classes = get_base_classes()

    name_to_obj = defaultdict(ClassObj)

    for cls in config.aast:
        if isinstance(cls, ClassObj):
            class_name = cls.class_info.name
            name_to_obj[class_name] = cls

    for cls in base_classes:
        class_name = cls.class_info.name
        name_to_obj[class_name] = cls

    res = defaultdict(lambda : defaultdict(dict))
    seen = set()

    for class_name in config.class_map.keys():
        if class_name in ["Bool", "Int"]:
            continue
        cur_class = name_to_obj[class_name]
        stk = []

        cur = cur_class
        while cur:
            cur_name = cur.class_info.name
            stk.append(cur_name)

            if cur.parent:
                parent_name = cur.parent.name
                cur = name_to_obj[parent_name]
            else:
                cur = None

        if class_name != "Object" and "Object" not in stk:
            stk.append("Object")

        if class_name == "Main" and "IO" not in stk:
            stk.append("IO")

        stk.reverse()

        for cur_class in stk:
            cls = name_to_obj[cur_class]

            for feature in cls.feature_list:
                if isinstance(feature, Method):
                    method_name = feature.identifier.name
                    config.method_map.append_obj(cur_class, feature)
                    if class_name not in res or class_name in res and method_name not in res[class_name]:
                        res[class_name][method_name] = None
                    if (cur_class, method_name) not in seen:
                        if class_name in res and method_name in res[class_name] and res[class_name][method_name]:
                            prev_class = res[class_name][method_name][0]
                            seen.remove((prev_class, method_name))
                        res[class_name][method_name] = (cur_class, feature)
                        seen.add((cur_class, method_name))

    return res


# TODO: NEED TO ADD BOOL, INT
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
