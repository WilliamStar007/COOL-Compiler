-- Good Tests: Test1.cl
class Main inherits IO {
	-- TEST ASSIGNMENTS
	true_bool : Bool <- true;
	false_bool : Bool <- false;
	one : Int <- 1;
	helloThere : String <- "Hello There";
	theNewTest : TestNew <- (new TestNew).init("Howdy", "Bros");

	-- TEST STRING INTERNALS
	string1 : String <- "hello";
	string2 : String <- "world";
	string3 : String <- "Hello";
	string4 : String <- "World";
	string5 : String <- "HELLO";
	string6 : String <- "WORLD";
	string7 : String <- "HI";
	string8 : String <- "THERE";
	string9 : String <- "Howdy";
	string10 : String <- "Bro";
	string11 : String <- "Aye";
	x : Int;
	test4 : Test4 <- new Test4;
	getA() : String {theNewTest.getA()};
	main() : Object {{


	-- TEST STRING INTERNALS

	test4.someFunc();
	string1 <- string2.concat(string3);
	string1 <- string1.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	x <- string1.length();
	string11 <- string1.concat(string2).concat(string3).concat(string4).concat(string5).concat(string6).concat(string7).concat(string8).concat(string9).concat(string10).concat(string11);
	x <- string11.length();
	string5 <- string11.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	x <- string5.length();
  -- TEST ASSIGNMENTS
		-- big expression
	x <-	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29;
		-- Arithmetic
		-- Many expressions
		x <-5 + 5;
		x <- 7 / 5;
		x <- 6 * 2;
		x <- 5 - 2;
		x <- 5 - 2 + 7 * 5;
	x <-	2 / 7;
		x <-1 / 7;
		x <-2 + 2;
		x <-7 /2;
		x <-1 / 8;
		x <-1 / 9; 
		x <-1 / 10;
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
		x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
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
	

	-- TEST: one nested expression with arith ops
	-- TEST: eval order arith
	(5 * 5 + 7 / 2- 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / (29 + (	5 * 5 + 7 / 2 - (5 * (1 - (2 + (3 / (4 * (5 + 6) - 7)* 8 / 9) + 10) - 11) * 12) / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + (7 / (2 - (5 * (1 - 2) + 3) / 4 )* 5) + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / (17 + (18 - (19 * (20 / (21 + (22 - 23) * 24) / 25) + 26) - 27) * 28) / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29))
	- (	5 * 5 + (7 / 2 - (5 * (1 - (2 + 3 / 4 )* 5 )+ 6) - 7) * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / (17 + (18 - 19 * 20 / 21 + 22 - 23) * 24) / 25 + 26 - 27  * 28 / 29));
	-- TEST abort()
	abort();
	out_string("Hello");
	abort();
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

	string1 : String <- "hello";
	string2 : String <- "world";
	string3 : String <- "Hello";
	string4 : String <- "World";
	string5 : String <- "HELLO";
	string6 : String <- "WORLD";
	string7 : String <- "HI";
	string8 : String <- "THERE";
	string9 : String <- "Howdy";
	string10 : String <- "Bro";
	string11 : String <- "Aye";

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

class Test4 inherits TestNew {

	string12 : String <- "hola";
	string13 : String <- "el mundo";
	string14: String <- "Hola";
	string15: String <- "El mundo";
	string16: String <- "HOLA";
	string17: String <- "EL MUNDO";
	string18 : String <- "holA";
	string19: String <- "Buenos ";
	string20: String <- "Buenas Tardes";
	string21 : String <- "Hola a todos ";
	string22 : String <- "Hola a TODOS";
	x : Int;
	shallowCopy : String <- "copy";
	deepCopy : Copy <- (new Copy).init(1, 2, 3);
	theDeepCopy : Copy;
	copy2 : Copy;
	copy3 : Copy;
	someCopy: Copy <- (new Copy).init(4, 5, 6);
	otherCopy : Copy <- (new Copy).init(7, 8, 9);
	someFunc() :  Object {


		{

				-- TEST STRING INTERNALS
	string12 <- string13.concat(string14);
	string12 <- string12.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	x <- string12.length();
	string22 <- string12.concat(string13).concat(string14).concat(string15).concat(string16).concat(string17).concat(string18).concat(string19).concat(string20).concat(string21).concat(string22);
	x <- string22.length();
	string16 <- string22.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	x <- string16.length();
	out_string("TEST 4");

	string1 <- string2.concat(string3);
	string1 <- string1.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	x <- string1.length();
	string11 <- string1.concat(string2).concat(string3).concat(string4).concat(string5).concat(string6).concat(string7).concat(string8).concat(string9).concat(string10).concat(string11);
	x <- string11.length();
	string5 <- string11.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	x <- string5.length();
	shallowCopy <- string11.copy().concat((new String)).copy();
	theDeepCopy <- deepCopy.copy1();

	theDeepCopy.printA();
	theDeepCopy.printA();
	deepCopy.printA();
	copy2 <- someCopy.copy1().copy1().copy1().copy1();
	copy3 <- (new Copy).init(copy2.getA(), deepCopy.copy1().getB(), otherCopy.copy1().getC());
	copy3.printA();
	



		}
	};

};


class Copy inherits IO {
a : Int;
b : Int;
c : Int;
init(valA : Int, valB : Int, valC : Int) : SELF_TYPE {
	{
		a <- valA;
		b <- valB;
		c <- valC;
		self;
	}
};
 copy1() : Copy {(self).init(a, b, c)};

 printA() : Object {out_int(a)};

 getA()  : Int {a};
 getB() : Int {b};
 getC() : Int {c};

};
