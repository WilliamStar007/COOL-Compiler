-- Good Tests: Test1.cl
class Main inherits IO {
	true_bool : Bool <- true;
	false_bool : Bool <- false;
	one : Int <- 1;
	helloThere : String <- "Hello There";
	theNewTest : TestNew <- (new TestNew).init("Howdy", "Bros");
	getA() : String {theNewTest.getA()};
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

	-- TEST NEW and test New self dispatch
	theNewTest <- new TestNew;
	getA();
	if theNewTest.testThis().testThat().testThose().getA() = theNewTest.getB()
	then out_string("=)\n").out_string((new TestNew).getA())
	else out_string("=(\n").out_string((new TestNew).getB())
	fi;

	-- TEST not expression
	if not (theNewTest.testThis().testThat().testThose().getA() = theNewTest.getB())
	then out_string("=)\n").out_string((new TestNew).getA())
	else out_string("=(\n").out_string((new TestNew).getB())
	fi;

	if not (not(true_bool = false_bool)) then out_string("WRONG") else out_string("CORRECT") fi;
	if not(not (not (true_bool = true))) then out_string("CORRECT") else out_string("WRONG") fi;
	if not(not(not(not (not (false_bool = false))))) then out_string("CORRECT") else out_string("WRONG") fi;
	}



	};

};

class Test1 inherits IO {

		-- TEST: new and self type
		some_number: Int <- helloThere(new SELF_TYPE);
		helloThere(value:Test1):Int { 5000 };
	other_main(): SELF_TYPE {
 out_string("Hello, World.\n")
	};
};

class TestNew inherits IO{

	a : String <- "Test";
	b : String <- "New";
	init(valA : String, valB : String) : TestNew {
		{
		a = valA;
		b = valB;
		self;
		}
	};

	exihbit(): Object {
		out_int(1).out_string(a).out_string(b).out_int(1)
	};
	testThis(): TestNew {
		{
		a <- "Hi";
		self;
		}
	};

	testThat(): TestNew {
		{
		b <- "Hello";
		self;
		}
	};
	testThose() : TestNew {
		{
			a <- "Hello";
			b <- "New";
			self;
		}
	};

	getA() : String {
		a
	};
	getB() : String {
		b
	};
	


};
