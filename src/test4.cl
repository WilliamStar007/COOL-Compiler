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
-- SNEAKY STACK OVERFLOW
class Parent2 {
	theChild : Child <- new Child;

};

class Child inherits Parent2 {
	attr1 : Parent2 <- new Parent2;
};
class Main inherits IO {
	voidClass : VoidClass;
	stackOver : StackOver <- new StackOver;
	ctor : CtorOverFlow <- new CtorOverFlow;
	theChild : Child <- new Child;
	theParent : Parent2 <- new Parent2;
	newX : TestX <- new TestX;
	theInput : IO <- new IO;
	theNum : Int;
	theWord : String;
	theTruth : Bool;
	someObj : Object <- new Object;
	x : Int;
	-- STACK OVERFLOW
	recursion(n: Int) : Int {n * recursion(n + 1)};
	fact(n : Int) :  Int {n * recursion(n - 1)};
	mututalrecursion(n : Int) : Int {{
		func1(n);
	}};
	func1(n : Int) : Int {func2(n - 1)};
	func2(n : Int) : Int {func1(n + 1)};
	main() : Object {{
    
		-- Division by zero
		x <- 7 / 0;
		x <- 0 / 0;
		x <- 1 / 0;
		x <- 2 / 0;
		x <- 3 / 0;
		x <- 4 / 0;
		x <- 5 / 0;
		x <- 100 / 0;
		x <- 10 + 10 / 0 + 2;
		x <- 10 / ( 5- 5);
		x <- 10 / ( 5 * 0);
		x <- 5 * 5 + 7 / 0 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 0 + 22 - 23 * 24 / 0 + 26 - 27  * 28 / 29 +	5 * 5 + 7 / 0 - 5 * 1 - 2 + 3 / 0 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 0 + 22 - 23 * 24 / 0 + 26 - 27  * 28 / 29
		* 5 * 5 + 7 / 0 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 0 + 26 - 27  * 28 / 29
		/ 	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 0 * 5 + 6 - 7 * 8 / 0 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 0 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 0 + 26 - 27  * 28 / 29
		+ 	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 0 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 0 + 26 - 27  * 28 / 29
		- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 0 + 18 - 19 * 20 / 0 + 22 - 23 * 24 / 0 + 26 - 27  * 28 / 29+ 10 / 0;
		x <-  (5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) / 0;
		x <- 5;
		x <-  x / 0;
		x <- 0;
		x <- x / x;
		x <- (5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) /
		(5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
		5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5)
		/ (5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
		5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5)
		/ (5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
		5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 ) /
		(5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
			5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 ) /
			(5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
				5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 ) /
				(5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
					5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 ) /
					(5 - 5 + 5 -5 + 5 -5 + 5 -5 + 5 -5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 -5 - 5 + 5 - 5 +
						5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 + 5 - 5 );
		x <- 1 / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0 / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0  / 0 / 0 / 0 / 0 / 0;

		x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + (3 / 0) * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29);

		x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 0);
		
		voidClass@Object.copy();
		voidClass@Object.type_name();
		voidClass.someMethod();

		case newX of 
		a : TestA => 0 / 0;
		b : TestB => 1 / 0;
		c : TestC => 2 /0 ;
		d : TestD => 3 / 0;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4 / 0;
		i : TestJ => 1 / 0;
		k : TestK => 2 / 0;
		l : TestL => 3 /0 ;
		m : TestM => 4 / 0;
		n : TestN => 1 / 0;
		o : TestP => 2 / 0;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		esac;

		case voidClass of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		esac;


	case someObj of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		esac;


		case someObj of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		something : String => 0;
		something2 : Bool => 0;
		something3 : Int => 0;
		something4 : IO => 0;
		esac;

		case someObj of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		something : String => 0;
		something2 : Bool => 0;
		something3 : Int => 0;
		something4 : IO => 0;
		from1 : FromIO1 => 0;
		from2 : FromIO2 => 0;
		from3 : FromIO3 => 0;
		from4 : FromIO4 => 0;
		from5 : FromIO5 => 0;
		from6 : FromIO6 => 0;
		from7 : FromIO7 => 0;
		from8 : FromIO8 => 0;
		from9 : FromIO9 => 0;
		from10 : FromIO10 => 0;
		from11 : FromIO11 => 0;
		from12 : FromIO12 => 0;
		from13 : FromIO13 => 0;
		from14 : FromIO14 => 0;
		from15 : FromIO15 => 0;
		from16 : FromIO16 => 0;
		from17 : FromIO17 => 0;
		from18 : FromIO18 => 0;
		from19 : FromIO19 => 0;
		from20 : FromIO20 => 0;
		from21 : FromIO21 => 0;
		from22 : FromIO22 => 0;
		from23 : FromIO23 => 0;
		from24 : FromIO24 => 0;
		from25 : FromIO25 => 0;
		esac;
						(* theInput : IO <- new IO;
	theNum : Int;
	theWord : String;
	theTruth : Bool;*)
		case theInput of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		something : String => 0;
		something2 : Bool => 0;
		something3 : Int => 0;
		from1 : FromIO1 => 0;
		from2 : FromIO2 => 0;
		from3 : FromIO3 => 0;
		from4 : FromIO4 => 0;
		from5 : FromIO5 => 0;
		from6 : FromIO6 => 0;
		from7 : FromIO7 => 0;
		from8 : FromIO8 => 0;
		from9 : FromIO9 => 0;
		from10 : FromIO10 => 0;
		from11 : FromIO11 => 0;
		from12 : FromIO12 => 0;
		from13 : FromIO13 => 0;
		from14 : FromIO14 => 0;
		from15 : FromIO15 => 0;
		from16 : FromIO16 => 0;
		from17 : FromIO17 => 0;
		from18 : FromIO18 => 0;
		from19 : FromIO19 => 0;
		from20 : FromIO20 => 0;
		from21 : FromIO21 => 0;
		from22 : FromIO22 => 0;
		from23 : FromIO23 => 0;
		from24 : FromIO24 => 0;
		from25 : FromIO25 => 0;
		esac;


		case theNum of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		something : String => 0;
		something2 : Bool => 0;
		something3 : IO => 0;
		from1 : FromIO1 => 0;
		from2 : FromIO2 => 0;
		from3 : FromIO3 => 0;
		from4 : FromIO4 => 0;
		from5 : FromIO5 => 0;
		from6 : FromIO6 => 0;
		from7 : FromIO7 => 0;
		from8 : FromIO8 => 0;
		from9 : FromIO9 => 0;
		from10 : FromIO10 => 0;
		from11 : FromIO11 => 0;
		from12 : FromIO12 => 0;
		from13 : FromIO13 => 0;
		from14 : FromIO14 => 0;
		from15 : FromIO15 => 0;
		from16 : FromIO16 => 0;
		from17 : FromIO17 => 0;
		from18 : FromIO18 => 0;
		from19 : FromIO19 => 0;
		from20 : FromIO20 => 0;
		from21 : FromIO21 => 0;
		from22 : FromIO22 => 0;
		from23 : FromIO23 => 0;
		from24 : FromIO24 => 0;
		from25 : FromIO25 => 0;
		esac;
		case theTruth of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		something : String => 0;
		something2 : IO => 0;
		something3 : Int => 0;
		from1 : FromIO1 => 0;
		from2 : FromIO2 => 0;
		from3 : FromIO3 => 0;
		from4 : FromIO4 => 0;
		from5 : FromIO5 => 0;
		from6 : FromIO6 => 0;
		from7 : FromIO7 => 0;
		from8 : FromIO8 => 0;
		from9 : FromIO9 => 0;
		from10 : FromIO10 => 0;
		from11 : FromIO11 => 0;
		from12 : FromIO12 => 0;
		from13 : FromIO13 => 0;
		from14 : FromIO14 => 0;
		from15 : FromIO15 => 0;
		from16 : FromIO16 => 0;
		from17 : FromIO17 => 0;
		from18 : FromIO18 => 0;
		from19 : FromIO19 => 0;
		from20 : FromIO20 => 0;
		from21 : FromIO21 => 0;
		from22 : FromIO22 => 0;
		from23 : FromIO23 => 0;
		from24 : FromIO24 => 0;
		from25 : FromIO25 => 0;
		esac;
		
		case theWord of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		something : IO => 0;
		something2 : Bool => 0;
		something3 : Int => 0;
		from1 : FromIO1 => 0;
		from2 : FromIO2 => 0;
		from3 : FromIO3 => 0;
		from4 : FromIO4 => 0;
		from5 : FromIO5 => 0;
		from6 : FromIO6 => 0;
		from7 : FromIO7 => 0;
		from8 : FromIO8 => 0;
		from9 : FromIO9 => 0;
		from10 : FromIO10 => 0;
		from11 : FromIO11 => 0;
		from12 : FromIO12 => 0;
		from13 : FromIO13 => 0;
		from14 : FromIO14 => 0;
		from15 : FromIO15 => 0;
		from16 : FromIO16 => 0;
		from17 : FromIO17 => 0;
		from18 : FromIO18 => 0;
		from19 : FromIO19 => 0;
		from20 : FromIO20 => 0;
		from21 : FromIO21 => 0;
		from22 : FromIO22 => 0;
		from23 : FromIO23 => 0;
		from24 : FromIO24 => 0;
		from25 : FromIO25 => 0;
		esac;

		case someObj of 
		a : TestA => 0;
		b : TestB => 1;
		c : TestC => 2;
		d : TestD => 3;
		e : TestE => let x  : Int <- 9 in x + 5;
		f : TestF => let x  : String <- "Howdy" in x.concat("Matey");
		g : TestG => let x  : Int <- 10 in x + 5;
		h : TestH => 4;
		i : TestJ => 1;
		k : TestK => 2;
		l : TestL => 3;
		m : TestM => 4;
		n : TestN => 1;
		o : TestP => 2;
		q : TestQ => 3;
		r : TestR => 4;
		s : TestS => 1;
		t : TestT => 2;
		u : TestU => 3;
		v : TestV => 4;
		from2 : FromIO2 => 0;
		from3 : FromIO3 => 0;
		from4 : FromIO4 => 0;
		from5 : FromIO5 => 0;
		from6 : FromIO6 => 0;
		from7 : FromIO7 => 0;
		from8 : FromIO8 => 0;
		from9 : FromIO9 => 0;
		from10 : FromIO10 => 0;
		from11 : FromIO11 => 0;
		from12 : FromIO12 => 0;
		from13 : FromIO13 => 0;
		from14 : FromIO14 => 0;
		from15 : FromIO15 => 0;
		from16 : FromIO16 => 0;
		from17 : FromIO17 => 0;
		from18 : FromIO18 => 0;
		from19 : FromIO19 => 0;
		from20 : FromIO20 => 0;
		from21 : FromIO21 => 0;
		from22 : FromIO22 => 0;
		from23 : FromIO23 => 0;
		from24 : FromIO24 => 0;
		from25 : FromIO25 => 0;
		from26 : FromIO26 => 0;
		from27 : FromIO27 => 0;
		from28 : FromIO28 => 0;
		from29 : FromIO29 => 0;
		from30 : FromIO30 => 0;
		from31 : FromIO31 => 0;
		from32 : FromIO32 => 0;
		from33 : FromIO33 => 0;
		from34 : FromIO34 => 0;
		from35 : FromIO35 => 0;
		from36 : FromIO36 => 0;
		from37 : FromIO37 => 0;
		from38 : FromIO38 => 0;
		from39 : FromIO39 => 0;
		from40 : FromIO40 => 0;
		from41 : FromIO41 => 0;
		from42 : FromIO42 => 0;
		from43 : FromIO43 => 0;
		from44 : FromIO45=> 0;
		from46 : FromIO46 => 0;
		from47 : FromIO47 => 0;
		from48 : FromIO48 => 0;
		from49 : FromIO49 => 0;
		from50 : FromIO50 => 0;
		from51 : FromIO51 => 0;
		from52 : FromIO52 => 0;
		from53 : FromIO53 => 0;
		from54 : FromIO54 => 0;
		from55 : FromIO55 => 0;
		from56 : FromIO56 => 0;
		from57 : FromIO57 => 0;
		from58 : FromIO58 => 0;
		from59 : FromIO59 => 0;
		from60 : FromIO60 => 0;
		from61 : FromIO61 => 0;
		from62 : FromIO62 => 0;
		from63 : FromIO63 => 0;
		from64 : FromIO64 => 0;
		from65 : FromIO65 => 0;
		from66 : FromIO66 => 0;
		from67 : FromIO67 => 0;
		from68 : FromIO68 => 0;
		from69 : FromIO69 => 0;
		from70 : FromIO70 => 0;
		from71 : FromIO71 => 0;
		from72 : FromIO72 => 0;
		from73 : FromIO73 => 0;
		from74 : FromIO74 => 0;
		from75 : FromIO75 => 0;
		from76 : FromIO76 => 0;
		from77 : FromIO77 => 0;
		from78 : FromIO78 => 0;
		from79 : FromIO79 => 0;
		from80 : FromIO80 => 0;
		from81 : FromIO81 => 0;
		from82 : FromIO82 => 0;
		from83 : FromIO84 => 0;
		esac;

		-- TEST: subtring out of range. DONE
		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0,1000);
		out_string("testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(0, 1);
		out_string("testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(50, 9);
		out_string("testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		"test".substr(4, 5);
		out_string("test");
		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 10).substr(2, 10).substr(3, 10).substr(4, 10).substr(9, 12);
		"".substr(1,10);
		"".substr(0, 1000000);
		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 10).substr(2, 10).substr(3, 10).substr(0, 11);
		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 10).substr(2, 10).substr(3, 12);

		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 10).substr(2, 11);


		"testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 12);


    
	}
	};
};

class Parent {
 someMethod() : Int {5};
};
class VoidClass inherits Parent {

};
-- STACK OVERFLOW
class StackOver {
	flow : StackOver <- new StackOver;
};

-- STACK OVERFLOW
class CtorOverFlow {
	init(a : Int, b : Int, c : Int) : SELF_TYPE {init(a, b, c)};

};
class TestA inherits IO {};
class TestB inherits TestA {};
class TestC inherits TestB {};
class TestD inherits TestC {};
class TestE inherits TestD {};
class TestF inherits TestE {};
class TestG inherits TestF {};
class TestH inherits TestG {};
class TestI inherits TestH {};
class TestJ inherits TestI {};
class TestK inherits TestJ {};
class TestL inherits TestK {};
class TestM inherits TestL {};
class TestN inherits TestM {};
class TestO inherits TestN {};
class TestP inherits TestO {};
class TestQ inherits TestP {};
class TestR inherits TestQ {};
class TestS inherits TestR {};
class TestT inherits TestS {};
class TestU inherits TestT {};
class TestV inherits TestU {};
class TestW inherits TestV {};
class TestX inherits TestW {};
class TestY inherits TestX {};

class FromIO1 inherits IO {


	copy() : SELF_TYPE {self};
};
class FromIO2 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO3 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO4 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO5 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO6 inherits IO 
{copy() : SELF_TYPE {self};};
class FromIO7 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO8 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO9 inherits IO {
	copy() : SELF_TYPE {self};
};
class FromIO10 inherits IO {copy() : SELF_TYPE {self};};
class FromIO11 inherits IO {};
class FromIO12 inherits IO {};
class FromIO13 inherits IO {};
class FromIO14 inherits IO {};
class FromIO15 inherits IO {};
class FromIO16 inherits IO {};
class FromIO17 inherits IO {};
class FromIO18 inherits IO {};
class FromIO19 inherits IO {};
class FromIO20 inherits IO {};
class FromIO21 inherits IO {};
class FromIO22 inherits IO {};
class FromIO23 inherits IO {};
class FromIO24 inherits IO {};
class FromIO25 inherits IO {};
class FromIO26 inherits IO {};
class FromIO27 inherits IO {};
class FromIO28 inherits IO {};
class FromIO29 inherits IO {};
class FromIO30 inherits IO {};
class FromIO31 inherits IO {};
class FromIO32 inherits IO {};
class FromIO33 inherits IO {};
class FromIO34 inherits IO {};
class FromIO35 inherits IO {};
class FromIO36 inherits IO {};
class FromIO37 inherits IO {};
class FromIO38 inherits IO {};
class FromIO39 inherits IO {};
class FromIO40 inherits IO {};
class FromIO41 inherits IO {};
class FromIO42 inherits IO {};
class FromIO43 inherits IO {};
class FromIO44 inherits IO {};
class FromIO45 inherits IO {};
class FromIO46 inherits IO {};
class FromIO47 inherits IO {};
class FromIO48 inherits IO {};
class FromIO49 inherits IO {};
class FromIO50 inherits IO {};
class FromIO51 inherits IO {};
class FromIO52 inherits IO {};
class FromIO53 inherits IO {};
class FromIO54 inherits IO {};
class FromIO55 inherits IO {};
class FromIO56 inherits IO {};
class FromIO57 inherits IO {};
class FromIO58 inherits IO {};
class FromIO59 inherits IO {};
class FromIO60 inherits IO {};
class FromIO61 inherits IO {};
class FromIO62 inherits IO {};
class FromIO63 inherits IO {};
class FromIO64 inherits IO {};
class FromIO65 inherits IO {};
class FromIO66 inherits IO {};
class FromIO67 inherits IO {};
class FromIO68 inherits IO {};
class FromIO69 inherits IO {};
class FromIO70 inherits IO {};
class FromIO71 inherits IO {};
class FromIO72 inherits IO {};
class FromIO73 inherits IO {};
class FromIO74 inherits IO {};
class FromIO75 inherits IO {};
class FromIO76 inherits IO {};
class FromIO77 inherits IO {};
class FromIO78 inherits IO {};
class FromIO79 inherits IO {};
class FromIO80 inherits IO {};
class FromIO81 inherits IO {};
class FromIO82 inherits IO {};
class FromIO83 inherits IO {};
class FromIO84 inherits IO {};
