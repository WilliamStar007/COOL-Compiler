'''
All global variables
'''

# Imports
from collections import defaultdict
from mappings import ClassMap, ClassTag, ImplementationMap, OffsetMap, ParentMap

# Lines from file
lines = []
# Annotated abstract syntax tree
aast = []

# Mappings
class_map = ClassMap()
impl_map = ImplementationMap()
parent_map = ParentMap()

# Map of class -> list of accessible methods
class_tags = ClassTag()
offset_map = OffsetMap()

symbol_table = defaultdict(lambda: defaultdict(list))
str_num_contents = defaultdict(str)
