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
  theObj : Object <- new Object;
  x : Int;
  theInput : IO <- new IO;
  theInput1 : FromIO1 <- new FromIO1;
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
      case theObj of 
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


      case theA of 
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


      case theInput of 
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


      case theInput1 of 
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
