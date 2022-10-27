'''
This file has all assembly logic
'''

    # Print vtables: need vtable for every class in the program
    # Print constructors
    # Print methods
    # Print start label

    for cls in classes:
        # create label for vtable
        # mapped to a numerical addr in memory
        # labels compile into addresses
        # so whenever you refer to label, replaced w numerical addr
        print(f"{cls}..vtable")
        # label for constructor
        print(f"\t\tconstant {cls}..new")

        if cls in implementation_map:
            for method in implementation_map[cls]:
                print(f"\t\tconstant {method.method_label}")

    # print constructors

    for cls in classes:
        print(f"{cls}..new")
        print("\t\tmov fp <- sp")
        print("\t\tpush ra")

        # load size into a register
        # Should know this statistically from the number of attributes

        # *p -> heap
        # [ vtable, attributes... ]

        print(f"\t\tli {self_reg} <- {len(class_map[cls]) + 1}")

        # Ask the OS for space in the heap. DIF FOR x86

        print(f"alloc {self_reg} {self_reg}")

        # Store attributes

        # Get vtable ptr into newly-allocated space
        print(f"\t\tla {tmp_reg} <- {cls}..vtable")
        print(f"\t\tst {self_reg}[vtable_offset] <- {tmp_reg}")

        for i, attr in enumerate(class_map[cls]):

            print("\t\tpush fp")
            print("\t\t {self_reg}")

            print(f"\t\tla {tmp_reg} <- {attr.type}..new")
            print(f"\t\tcall {tmp_reg}")

            print("\t\tpop {self_reg}")
            print("\t\tpop fp")

            if attr.init:
                print("\t\tplaceholder cgen")

                print("\t\tst {self_reg}[{i + 1}] <- {acc_reg}")

        # Missing some?

    for method in ast:
        # Make label
        print(f"{method.method_label} :")

        print("\t\tmov fp <- sp")
        print("\t\tpush ra")

        cgen(method.expr)

        print("\t\tpop ra")
        print("\t\treturn")
