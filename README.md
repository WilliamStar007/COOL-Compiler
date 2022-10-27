TODO:
1. Create tree class
- All nodes
- In separate files
- No repr required
2. Create reader
- Class map
- Implementation map
- AAST
3. Symbol table logic
4. Review architecture
5. Plan
6. Write




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
        