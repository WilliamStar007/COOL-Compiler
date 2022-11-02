#!/usr/bin/python

'''
Main file
'''

# Imports
import sys
import config
from reader import read_input

def main():
    '''
    Main method
    Reads in input
    Assembles all mappings
    Constructs symbol table
    Constructs vtables
    Calls all functions to begin code generation
    '''
    if len(sys.argv) < 2:
        print("Specify .cl-type input file")
        sys.exit(1)
    with open(sys.argv[1], encoding="utf-8") as f:
        config.lines = [l.rstrip() for l in f.readlines()]

    # Assembles the maps and the AAST
    read_input()

    if len(sys.argv) == 3:
        print("TESTING SUITE")

        output_filename = "test.cl-type"

        test_str = ""
        match sys.argv[2]:
            case 'class_map':
                test_str = f"{config.class_map}"
            case 'impl_map':
                test_str = f"{config.impl_map}"
            case 'aast':
                test_str = f"{config.class_map}\n{config.impl_map}\n{config.aast}"
            case _:
                print("INVALID")

        outfile = open(output_filename, 'w', encoding="utf-8")
        outfile.write(test_str)
        outfile.close()

        exit(0)

    # Assemble symbol table

    # Assemble vtable



    # Output logic
    output_str = ""

    # Print vtables
    # Print constructors
    # Print globals
    # Print program start
    # Print rest. Need to explore this part

    # Output file logic
    output_filename = sys.argv[1]
    output_filename = output_filename[:-7] + "s"

    outfile = open(output_filename, 'w', encoding="utf-8")
    outfile.write(output_str)
    outfile.close()


if __name__ == '__main__':
    main()
