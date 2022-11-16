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
	out_int(x);
	test4.someFunc();
	string1 <- string2.concat(string3);
	string1 <- string1.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	x <- string1.length();
	out_string("x : ");
	out_int(x);
	out_string("\n");
	string11 <- string1.concat(string2).concat(string3).concat(string4).concat(string5).concat(string6).concat(string7).concat(string8).concat(string9).concat(string10).concat(string11);
	out_string("string11 : ");
	out_string(string11);
	out_string("\n");
	x <- string11.length();
	out_string("x : ");
	out_int(x);
	out_string("\n");
	string5 <- string11.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	out_string("string5 : ");
	out_string(string5);
	out_string("\n");
	x <- string5.length();
	out_string("x : ");
	out_int(x);
	out_string("\n");
  -- TEST ASSIGNMENTS
		-- big expression
	x <-	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29;
	out_int(x);
		-- Arithmetic
		-- Many expressions
		x <-5 + 5;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 7 / 5;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		
		x <- 6 * 2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 5 - 2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 5 - 2 + 7 * 5;
		out_string("x : ");
		out_int(x);
		out_string("\n");
	x <-	2 / 7;
	out_string("x : ");
	out_int(x);
	out_string("\n");
		x <-1 / 7;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <-2 + 2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <-7 /2;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <-1 / 8;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <-1 / 9; 
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <-1 / 10;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 11;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 12;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 13;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1/ 14;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 15;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 16;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 17;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 / 18;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x  <- 1 * 19;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1  * 20;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 *  21;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 * 22;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 1 * 23;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29);
		out_string("x : ");
		out_int(x);
		out_string("\n");
		-- TEST: bool assigned in bool
		let some_bool: Bool <- true in some_bool;

		-- TEST: bool comparison
		if true_bool = false_bool then x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4  else x <- 5 * 5 + 7 / 2 - 5 * 1 - 2  fi;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		if true_bool = true then x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4  else x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4  fi;
		out_string("x : ");
		out_int(x);
		out_string("\n");
		if false_bool = false then x <- 10 else x <- 77 fi;
		out_string("x : ");
		out_int(x);
		out_string("\n");
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

	if not (not(true_bool = false_bool)) then x <- 10 * 10 * 10 + 5 / 2 else x <- 10 * 10 fi;
	out_string("x : ");
	out_int(x);
	out_string("\n");
	if not(not (not (true_bool = true))) then x <- 1 else x <- 10122432 fi;
	out_string("x : ");
	out_int(x);
	out_string("\n");
	if not(not(not(not (not (false_bool = false))))) then x <- 2 else x <- 4 fi;
	out_string("x : ");
	out_int(x);
	out_string("\n");

	

	-- TEST: one nested expression with arith ops
	-- TEST: eval order arith
	x <- (5 * 5 + 7 / 2- 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / (29 + (	5 * 5 + 7 / 2 - (5 * (1 - (2 + (3 / (4 * (5 + 6) - 7)* 8 / 9) + 10) - 11) * 12) / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	* (	5 * 5 + (7 / (2 - (5 * (1 - 2) + 3) / 4 )* 5) + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
	/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / (17 + (18 - (19 * (20 / (21 + (22 - 23) * 24) / 25) + 26) - 27) * 28) / 29)
	+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29))
	- (	5 * 5 + (7 / 2 - (5 * (1 - (2 + 3 / 4 )* 5 )+ 6) - 7) * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / (17 + (18 - 19 * 20 / 21 + 22 - 23) * 24) / 25 + 26 - 27  * 28 / 29));
	out_string("x : ");
	out_int(x);
	out_string("\n");
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
		out_string(a);
		out_string(b);
		a = valA;
		b = valB;
		out_string(a);
		out_string(b);
		self;
		}
	};

	exihbit(): Object {
		out_int(1).out_string(a).out_string(b).out_int(1)
	};
	testThis(): TestNew {
		{
		out_string(a);
		a <- "Hi";
		out_string(a);
		self;
		}
	};

	testThat(): TestNew {
		{
		out_string(b);
		b <- "Hello";
		out_string(b);
		self;
		}
	};
	testThose() : TestNew {
		{
			
			
			out_string("a : ");
			out_string(a);
			out_string("\n");
			out_string("b : ");
			out_string(b);
			out_string("\n");
			a <- "Hello";
			b <- "New";
			out_string("a : ");
			out_string(a);
			out_string("\n");
			out_string("b : ");
			out_string(b);
			out_string("\n");

			self;
		}
	};

	getA() : String {{
		out_string("a : ");
		out_string(a);
		out_string("\n");
		a;
	}};
	getB() : String { {
		out_string("b : ");
		out_string(b);
		out_string("\n");
		b;
	}
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

	void1 : Copy;
	void2 : Copy;
	nonVoid : Copy <- otherCopy;

	worker : Employee <- (new Employee).init1("The rain", 1000, 100000000);
	someFunc() :  Object {


		{

				-- TEST STRING INTERNALS
	string12 <- string13.concat(string14);
	out_string("string12 : ");
	out_string(string12);
	out_string("\n");
	string12 <- string12.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	out_string("string12 : ");
	out_string(string12);
	out_string("\n");
	x <- string12.length();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	string22 <- string12.concat(string13).concat(string14).concat(string15).concat(string16).concat(string17).concat(string18).concat(string19).concat(string20).concat(string21).concat(string22);
	out_string("string22 : ");
	out_string(string22);
	out_string("\n");

	x <- string22.length();
	out_string("class Test 4 x: ");
	out_int(x);
	out_string("\n");
	string16 <- string22.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	out_string("string16: ");
	out_string(string16);
	out_string("\n");

	x <- string16.length();
	out_string("class Test 4 x: ");
	out_int(x);
	out_string("\n");
	out_string("TEST 4");

	string1 <- string2.concat(string3);
	string1 <- string1.concat("HELLOLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
	x <- string1.length();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	string11 <- string1.concat(string2).concat(string3).concat(string4).concat(string5).concat(string6).concat(string7).concat(string8).concat(string9).concat(string10).concat(string11);
	out_string("class Test4 string11 : ");
	out_string(string11);
	out_string("\n");
	x <- string11.length();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	string5 <- string11.substr(0, 10).substr(0,9).substr(0, 8).substr(0, 7).substr(0, 6).substr(0, 5).substr(0, 4).substr(0, 3).substr(0, 2).substr(0, 1);
	out_string("class Test4 string5 : ");
	out_string(string5);
	out_string("\n");
	x <- string5.length();
	out_string("class Test4 x : ");
	out_int(x);
	out_string("\n");
	shallowCopy <- string11.copy().concat((new String)).copy();
	theDeepCopy <- deepCopy.copy1();

	theDeepCopy.printA();
	theDeepCopy.printA();
	deepCopy.printA();
	copy2 <- someCopy.copy1().copy1().copy1().copy1();
	copy3 <- (new Copy).init(copy2.getA(), deepCopy.copy1().getB(), otherCopy.copy1().getC());
	copy3.printA();


	-- Object comparison
	if theDeepCopy < someCopy then theDeepCopy.printSomething("Deep Copy less")
	else someCopy.printSomething("Shallow copy less") fi;
	if theDeepCopy = someCopy then theDeepCopy.printSomething("Deeep and shallow equal")
	else someCopy.printSomething("Not equal") fi;

	if void1 < void2 then theDeepCopy.printSomething("void1 is less") else 
	theDeepCopy.printSomething("void2 is less") fi;
	if void1 = void2 then theDeepCopy.printSomething("void1 equals void2") else 
	theDeepCopy.printSomething("void1 does not equal void2") fi;
	if void1 < theDeepCopy then  theDeepCopy.printSomething("void1 is less than deep copy")
	else theDeepCopy.printSomething("void1 is greater than deep copy") fi;
	if void1 = theDeepCopy then  theDeepCopy.printSomething("void1 is equal to deep copy")
	else theDeepCopy.printSomething("void1 is not equal to deep copy") fi;
	if void1 < nonVoid then theDeepCopy.printSomething("void1 is less than nonVoid")
	else theDeepCopy.printSomething("nonVoid is less than void1") fi;
	if void1 = nonVoid then theDeepCopy.printSomething("void1 is equal to nonVoid")
	else theDeepCopy.printSomething("void1 is not equal to nonVoid") fi;
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
 copy1() : Copy {{
	
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");
	(self).init(a, b, c);

}};

 printA() : Object {out_int(a)};

 getA()  : Int {{
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	a;

}};
 getB() : Int {{
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	b;

}};
 getC() : Int {{
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");
	c;
}};
 printSomething(output: String) : Object {{
	
	out_string("class Copy a: ");
	out_int(a);
	out_string("\n");
	out_string("class Copy b: ");
	out_int(b);
	out_string("\n");
	out_string("class Copy c: ");
	out_int(c);
	out_string("\n");
	out_string(output);}};

};

class Person inherits IO {
	name : String;
	age : Int;
	init(nameVal : String, ageVal : Int) : SELF_TYPE {
		{
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			name <- nameVal;
			age <- ageVal;
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			self;
		}
	};

};

class Employee inherits Person {
	salary : Int;
	init1(nameVal : String, ageVal: Int, salaryVal: Int) : SELF_TYPE {
		{
			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			out_string("class Person salary: ");
		  out_int(salary);
		  out_string("\n");

		name <- nameVal;
		ageVal <- ageVal;
		salary <- salaryVal;

			out_string("class Person name: ");
		  out_string(name);
		  out_string("\n");
			out_string("class Person age: ");
		  out_int(age);
		  out_string("\n");
			out_string("class Person salary: ");
		  out_int(salary);
		  out_string("\n");
			self;
		}

	};
};