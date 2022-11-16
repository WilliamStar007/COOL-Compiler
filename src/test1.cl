-- Good Tests: Test1.cl
class Main inherits IO {
	true_bool : Bool <- true;
	false_bool : Bool <- false;
	one : Int <- 1;
	helloThere : String <- "Hello There";
	main() : Object {{
    
		-- big expression
		5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29;
		-- Arithmetic
		-- Many expressions
		5 + 5;
		7 / 5;
		6 * 2;
		5 - 2;
		5 - 2 + 7 * 5;
		2 / 7;
		1 / 7;
		2 + 2;
		7 /2;
		1 / 8;
		1 / 9; 
		1 / 10;
		1 / 11;
		1 / 12;
		1 / 13;
		1/ 14;
		1 / 15;
		1 / 16;
		1 / 17;
		1 / 18;
		1 / 19;
		1 / 20;
		1 / 21;
		1 / 22;
		1 / 23;
		5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29);
		-- TEST: bool assigned in bool
		let some_bool: Bool <- true in some_bool;

		-- TEST: bool comparison
		if true_bool = false_bool then out_string("WRONG") else out_string("CORRECT") fi;
		if true_bool = true then out_string("CORRECT") else out_string("WRONG") fi;
		if false_bool = false then out_string("CORRECT") else out_string("WRONG") fi;
		-- TEST: copy self dispatch
		copy();

		-- TEST: copy initialize object
		(new Object).copy();
		-- TEST:Hello
		out_string("Hello, World.\n");


		-- TEST: nested let
		let a : Int <- 0 in 
			let b : Int <- 1 in
					let c : Int <- 2 in
							let d : Int <- 3 in
									let e : Bool <- false in
											let f : Bool <- true in
													let g : String <- "Hello" in
														  out_string("Hello");
-- TEST normal methods
	one.copy();
 helloThere.copy(); 
 true_bool.copy(); 
	helloThere.length();
		
	}

	};

};

class A inherits IO {
	other_main(): SELF_TYPE {
 out_string("Hello, World.\n")
	};
};
