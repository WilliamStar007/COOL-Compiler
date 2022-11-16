'''
Main file
'''

# Imports
import sys
import config
from reader import read_input
from assembly import print_assembly

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
        config.lines = [l.strip('\n') for l in f.readlines()]

    # Assembles the maps and the AAST
    read_input()

    output_str = print_assembly()

    # Output file logic
    output_filename = sys.argv[1]
    output_filename = output_filename[:-7] + "s"

    outfile = open(output_filename, 'w', encoding="utf-8")
    outfile.write(output_str)
    outfile.close()


if __name__ == '__main__':
    main()
