This project is divided into several different files. The main.py outputs the assembly code. The reader.py file reads in all input, assembles the class map, the implementation map, the parent map, and the AAST. The tree.py file has all nodes for each expression type. The mappings.py file contains all classes that pertain to tracking some sort of state throughout the program. The config.py file contains all global variables and mappings. The built_ins.py file contains all built in assembly instruction. The memory.py file contains all register objects. Lastly, the assembly.py file contains all logic for outputting assemby.

main.py
The main.py file simply calls the read_input() function from reader.py to assemble the AAST and all associated mappings from the type-checked output. It then assembles the output from the print functions in the assembly.py file.

reader.py
The reader.py read in the type-checked output and assembled all mappings. It first read in the class map, then the implementation map, then the parent map, and then the AAST. Apart from constructing the AAST to include the type of every node, we also included the underlying class in each node. This provided an easier means to find which class we were currently in and thus made accessing the symbol table and other information more eloquent.

tree.py
The tree.py file simply contained the nodes for each type of object in a cool program. All information here was passed to it via the functions in the reader.py file.

mappings.py
This file contained several different classes. `Mapping` was the base class for all other mappings. It was simply an abstracted dictionary. `ClassMap`, `ImplementationMap`, and `ParentMap` all inherited from Mapping and had their own `__repr__` function so that we could test for correctness. `ClassTag` also inherited from mapping and held the class tag of each class in the Cool program. It also had a reverse dictionary so that if one had a class' class tag, one could find the name of the class. `StringTag` did not inherit from any class and served to have a two-way dictionary that mapped a string to its string num and vice versa. Each unique string in the Cool program was saved and reused if repeated throughout the Cool program. Thus, this map allowed us to track the strings and avoid replication. `ObjSize` tracks the number of temporary registers required for each object, which is needed for the constructor and other aspects of the program such as dispatch which may return the object. `OffsetMap` mapped the offset of a variable to its class. `VTableMap` inherited from this to include a separate mapping of class name -> method name -> actual class method originates from. `SymbolTable` was a separate class that was used to track the current offset and register used for a symbol via a ditionary of class name -> variable name -> stack of tuples of offset comma register. This was designed as such to allow for dynamic variables and variables loaded into the program. Dynamic variables include let expressions and case expressions, while loaded variables include method calls wherein parameters were passed such that the program had to reference those parameters within the method. `Tracker` was an abstracted global variable to allow one to track a value.

config.py
This file contained all global variables. `lines` was the lines of input that was read in. `aast` was the annotated abstract syntax tree. `class_map` was the classmap. `impl_map` was the implementation map. `parent_map` was the parent map. `class_tags` tracked the class identifying information. `string_tag` mapped a static string to a number and vice versa. `vtable_map` contained the offset of each method relative to each class inside the vtable. `attr_map` contained the offset of each class attribute relative to each class. `symbol_table` tracked the symbols and stored dynamic variables. The initial state of symbol_table was all class attributes. `obj_size` tracks the number of temporary registers required to create each class. `OFFSET_AMT` is the number of bits per 1 entry on the stack. `SPC` helped to format the code. `dynamic` tracked the number of dynamic variables created. `rbp_offset` tracked the rbp offset, which was required as temporaries werepushed to the stack for each let statement and operation. Lastly, `jump_table` tracked the current branch number and was used to acquire unique branches.

built_ins.py
This file contained all assembly for built in methods that are not included in the Cool source program. They were modified to have the correct string numbers and branch labels. They also include all error statements.

memory.py
This file has all register classes. This includes all registers used. They do not have too much use at the moment but may become useful as we transition to TAC and PA6.

assembly.py
This file contains several components: cgen, print_vtables, print_ctors, print_methods, and print_cool_globals.
`cgen`
cgen has unique code generate per given Cool expression. I'll now discuss each specific expression inside cgen.
`Attribute`
We separated initialization of a default expression (0 or null for non-built-ins and empty strings) from the actual assignment.
`Expression Terminals`
An expression terminal consists of assembling a default value and then information unique to its type. Thus, each expression terminal calls cgen on its base `Expression` class, which calls the constructor for each unique class. Then, each terminal is handled differently. If the `Integer` is not none, its value is stored in a register before being stored at offset 24 relative to r13, which is where each integer value is stored.  If the `StringObj` is None, then it is the default value of `the.empty.string` and is stored at offset 24 from register r13. Otherwise, its unique string tag is mapped to the string and the value of the string is stored atoffset 24 from r13. Lastly, the default Expression has common creation for all built-ins. This can most likely be discarded in the future. Identifiers are just a reference so they are skipped.
`IsVoid`
Is void generates code for its rhs expression and then compares the result (stored in R13 as per the stack discipline) with 0. If it is true, then the expression is deemed void and a true boolean is returned. Otherwise, a false boolean is returned.
`Negate`
We wanted to reuse the `Minus` logic with negate, but we found that it followed a slightly different stack discipline in that the rbp offset was not changing during the construction of the integer, so we copied the code from Minus over. We want to change this in the future to optimize code reuse.
`NotExpr`
This functioned similarly to isvoid, where we compared 0 to r13, which stored the result of cgen(r13) (which was a boolean).
`NewExp`
New expression was simply a constructor. We stored the current state of the program as per the stack discipline and then called the constructor of the object, before restoring the state of the program.
`Assign`
Assign generated a result for rhs, added that result to the symbol table, and then moved r13 (which stored the result of cgen(rhs)) to the offset and register where the identifier is stored.
`Plus`, `Minus`, `Times`, `Divide`
These followed the same logic, where the result of lhs was stored in r13 and then moved onto the stack. Due to the fact that we used a temporary, we used a global rbp_offset to track the position that this temporary was stored on the stack as we calculated the value of rhs. Then we generated a new integer object and stored the result of the addition/subtraction to that object. No state was restored in this because the logic was done in the `room for temporaries` space of our call stack.
`Times` differed slightly in its implementation. We fixed the float error as per Akash's piazza post by doing arithmetic shifts. The size of the register was also expanded in one of the steps to allow for a number that may have overflowed.
`Divide` also differed slightly in that it ensures that rhs is not 0 before dividing by it. If it is 0, the control flow falls into an error branch. Otherwise it jumps to a successful division.
`Equality`
All equality handlers were equivalent to those from the reference compiler. All instances of equality were handled the same. Equality did not make room for temporaries, so the lhs/rhs sides were calculated and the proper equality handler was called.
`Block`
Blocks are implemented as a summation of the code gens for all the sub expressions.
`If`
If had several components:
A predicate, which compared the result with 0 and jumped if the result in r13 was not equivalent to 0 (with 0 being defined as false). Otherwise, it fell into the else branch. There was also an end branch that would be jumped to from the else branch so that code in the true branch was skipped.
`Loop`
Loops were implemented similarly to if. There is a predicate, which has its code generated and its value is compared with 0, or false. It jumps to the end branch if the predicate resulted in 0. Otherwise, it runs the body and will unconditionally jump back to the predicate branch.
`Case`
Case has several components.
It first generates its case expression and compares the resulting value with null, or 0. If it is 0, it will jump to the void branch. It then gathers all cases and creates valid branches from them. It then iterates through all the branches until it finds branches of a matching class tag. If it is a class with an invalid tag, it jumps to the error branch.
`Let`
Lets iterated through the list of formals and constructed default values if the formal was of that type and otherwise moved null into r13 for any classes. It then called cgen on the expr type before moving that number to a given offset from rbp and being pushede to the symbol table. Then cgen is called on the let body before all let bindings are popped from the symbol table and rbp_offset is incremented.
`Dispatches`
For all dispatches, the current state is saved and cgen is called on the formals with their result pushed to the stack. If the dispatch has an object type, cgen is called on it. Static and dynamic dispatch both have errors to account for the case where there is dispatch on a void object. This cannot happen in self object because the object must be alive if we are "inside" of it. The method is loaded from the vtable and called. The stack is restored by adding the number of temporaries plus one for the self object to the stack pointer. State is then restored.

`Vtables and constructors`
The format for these were taken from the cool reference compiler. The stack discipline used for this was inconsistent with other operations relative to the cgen. Space for temporaries was allocated for binary operations.
