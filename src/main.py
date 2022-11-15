'''
Main file
'''

# Imports
import sys
import config
from reader import read_input
from assembly import print_vtables, print_ctors, print_methods, print_cool_globals

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

    output = []

    output.append(print_vtables())
    output.append(print_ctors())
    output.append(print_methods())
    output.append(print_cool_globals())

    output_str = "".join(output)

    # Output file logic
    output_filename = sys.argv[1]
    output_filename = output_filename[:-7] + "s"

    outfile = open(output_filename, 'w', encoding="utf-8")
    outfile.write(output_str)
    outfile.close()


if __name__ == '__main__':
    main()
