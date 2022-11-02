'''
This file has all assembly logic
'''

import config


def print_vtables():
    '''
    Print program vtables
    '''
    str_num = 1
    ret = "\t\t\t## ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;\n"

    for key, val in config.impl_map.iterables():
        ret += f".globl {key}..vtable\n"
        # TODO: Can't get spacing but needs to end at col 25
        tmp = f"{key}..vtable:"
        tmp_len = len(tmp)
        num_spaces = 24 - tmp_len
        spaces = num_spaces * ' '

        ret += f"{key}..vtable:{spaces}## virtual function table for {key}\n"
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


    return ret
