TODO:
1. Create tree class
- All nodes
- In separate files
- No repr required
2. Create reader
- Class map
- Implementation map
- AAST
3. Print out vtables
4. Print out constructors
5. Symbol table logic
6. Review architecture
7. Plan
8. Write




Notes:
Want to establish calling conventions

base pointer: bottom of activation record
stack pointer: always at the top

Calling conventions
    Caller:
        push params
        push fp
        push r0
    Callee
        Setting up new activation:
        move fp <- sp
        push ra

        ... emit instructions ...

        pop ra
        return
    Caller
        pop r0
        pop fp
        pop parameters

Need to deserialize the tree

Want classes for:
    Expressions
    Instructions
        