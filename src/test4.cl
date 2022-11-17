-- Bad Tests: Test4.cl

(*
A dispatch (static or dynamic) on void.
A case on void.
Execution of a case statement without a matching branch.
Division by zero.
Substring out of range. (This error is always reported on line 0, since it occurs inside an "internal" library function.)
Heap overflow. (You do not need to implement this runtime error.)
Stack overflow.
*)
-- Which tests should be conducted here
class Main inherits IO {

	main() : Object {{
    
		-- Division by zero
		7 / 0;
	


    
	}

	};

}