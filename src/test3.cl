-- Bad Tests: Test3.cl
class Main inherits IO {
  y : String <- "hello";
  theA ; A;
  theB : B;
  theC : C;
  theD : D;
  voidWord : String;
  voidNum : Int;
  voidTrue: Bool;
  voidInput: IO;
  voidObj: Object;
  x : Int;
	main() : Object {{
    
	--TEST: Division by zero. DONE
  out_string("5 / 0");
		x <- 5 / 0;
    x <- 5 / (5 - 5);
    x <- 0 / 5;
    x <- 10 / ( 10 * 0);
    x <- 10 / ( 0 / 10);
    x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + (10 / 0);


    x <- (10 / 0) + 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + (10 / 0);


    x <- 5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29 + (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		* (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + (10 / 0) +  22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		/ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		+ (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29)
		- (	5 * 5 + 7 / 2 - 5 * 1 - 2 + 3 / 4 * 5 + 6 - 7 * 8 / 9 + 10 - 11 * 12 / 13 + 14 - 15 * 16 / 17 + 18 - 19 * 20 / 21 + 22 - 23 * 24 / 25 + 26 - 27  * 28 / 29) + (10 / 0);
  -- TEST: subtring out of range. DONE
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0,50);
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(0, 1);
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(50, 9);
   "test".substr(4, 5);
   "testaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa".substr(0, 10).substr(1, 10).substr(2, 10).substr(3, 10).substr(4, 10).substr(9, 12);
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
      esac;
-- TEST: case on void
    case theB of
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