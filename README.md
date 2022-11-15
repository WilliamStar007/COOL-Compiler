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
NOT FINISHED
`Expression Terminals`
An expression terminal consists of assembling a default value and then information unique to its type. Thus, each expression terminal calls cgen on its base `Expression` class, which calls the constructor for each unique class. Then, each terminal is handled differently. If the `Integer` is not none, its value is stored in a register before being stored at offset 24 relative to r13, which is where each integer value is stored.  If the `StringObj` is None, then it is the default value of `the.empty.string` and is stored at offset 24 from register r13. Otherwise, its unique string tag is mapped to the string and the value of the string is stored atoffset 24 from r13. Lastly, the default Expression 