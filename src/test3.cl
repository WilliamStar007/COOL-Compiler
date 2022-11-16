-- Bad Tests: Test3.cl

(*

A dispatch (static or dynamic) on void.
A case on void.
Execution of a case statement without a matching branch.
Division by zero.
Substring out of range. (This error is always reported on line 0, since it occurs inside an "internal" library function.)
Heap overflow. (You do not need to implement this runtime error.)
Stack overflow.

*)

class OverFlow2 inherits OverFlow {
  c : Int;
  d : Int;
  init(valC : Int, valD : Int) : SELF_TYPE {self.init(valC, valD)};
};

class OverFlow {
  a : Int;
  b : Int;
  -- STACK OVERFLOWS
  aOver : OverFlow <- new OverFlow;
  aOVer2 : OverFlow2 <- new OverFlow2;

  makeOverFlow2() : OverFlow2 {(new OverFlow2)};
};


class Main inherits IO {
  y : String <- "hello";
  theA : A;
  theB : B;
  theC : C;
  theD : D;
  voidWord : String;
  voidNum : Int;
  voidTrue: Bool;
  voidInput: IO;
  voidObj: Object;
  x : Int;
  aOver : OverFlow <- new OverFlow;
  
  --TEST Stack Overflow
  fact(n : Int) : Int { n * fact(n - 1)};

	main() : Object {{
  -- TEST Stack overflow
  fact(5);
   
	--TEST: Division by zero. DONE
  out_string("5 / 0");
		x <- 5 / 0;
    out_int(x);
    x <- 5 / (5 - 5);
    out_int(x);
    x <- 0 / 5;
    out_int(x);
    x <- 10 / ( 10 * 0);
    out_int(x);
    x <- 10 / ( 0 / 10);
    out_int(x);
    x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + (10 / 0);
    out_int(x);

    x <- (10 / 0) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + (10 / 0);
    out_int(x);

    x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + (10 / 0) +  22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + (10 / 0);
    out_int(x);
    x <- 5 / (5 * 0);
    out_int(x);
    x <- 5 / ( 5 / 0);
    out_int(x);

  -- TEST: subtring out of range. DONE
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0,50);
   out_string("testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(0, 1);
   out_string("testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(50, 9);
   out_string("testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
   "test".substr(4, 5);
   out_string("test");
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 10).substr(2, 10).substr(3, 10).substr(4, 10).substr(9, 12);
   "".substr(1,10);
   "".substr(0, 1000000);

  -- TEST: dynamic dispatch on void. DONE
    theB.copy();
    voidWord.copy();
    voidWord.type_name();
    voidNum.copy();
    voidNum.type_name();
    voidTrue.copy();
    voidTrue.type_name();
    voidInput.copy();
    voidInput.type_name();
    voidWord.substr(0,0);
    voidWord.concat("hello");
    voidObj.copy();
    voidObj.type_name();

  --TEST: static dispatch on void. DONE
    theB@A.myLetter();
    theB@Object.copy();
    theB@Object.type_name();
    theC@B.myLetter();
    theC@A.myLetter();
    theC@Object.copy();
    theC@Object.type_name();
    theD@B.myLetter();
    theD@A.myLetter();
    theD@C.myLetter();
    theD@Object.copy();
    theD@Object.type_name();
    
    
  -- TEST:  case without matching branch. DONE
    case y of 
      a : A => 0;
      b : B => 1;
      c : C => 2;
      d : D => 3;
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

    -- More case without matching branch
    case y of 
    a : Int => 0;
    b : Bool => 1;
    c : IO => 2;
    esac;
-- TEST: case on void
    case theB of
    a : A => 0;
      b : B => 1;
      c : C => 2;
      d : D => 3;
      esac; 
      case theA of
      a : A => 0;
        b : B => 1;
        c : C => 2;
        d : D => 3;
        esac; 

        case theC of
        a : A => 0;
          b : B => 1;
          c : C => 2;
          d : D => 3;
          esac; 
          case theD of
          a : A => 0;
            b : B => 1;
            c : C => 2;
            d : D => 3;
            esac; 
	}
	};
};

class A inherits IO {
  myLetter() : String {"A"};
  printA() : Object {out_string("A")};
};
class B inherits A {
  myLetter() : String {"B"};
};
class C inherits B {

  myLetter() : String {"C"};
};
class D inherits C {
  myLetter() : String {"D"};
};

class TestE inherits D {};
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

