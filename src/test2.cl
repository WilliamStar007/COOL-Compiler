-- Good Tests: Test2.cl
class Main inherits IO {
	-- Test Assignments
	one : One;
	two : Two;
	three : Three <- new Three;
	numOne : String <- "1";
	hello : String <- "hello";
	someA : TestA <- new TestA;
	otherA : TestA;
	someB : TestB <- new TestB;
	someZ : TestZ <- new TestZ;
	indexI : Int <- 0;
	aNumber : Int <- 0;
	temp : Int;


	fact(n : Int) : Int {
		{
			if n = 0 then 1 else n * fact(n - 1) fi;
		}

	};
	main() : Object {{
    
		-- TEST: void comparision and void with non void comparison
		if one = two then out_string("True") else out_string("FALSE") fi;
		if one =  three then out_string("TRUE") else out_string("FALSE") fi;
		-- TEST substring ok
		"test".substr(0, 4);
		-- TEST: string comparison, non-void comparison
		if numOne = hello then out_string("True") else out_string("FALSE") fi;
		if hello =  "hello" then out_string("TRUE") else out_string("FALSE") fi;
		if hello =  "HELLO" then out_string("TRUE") else out_string("FALSE") fi;
		-- diff scope
		let x  : Int <- 5 in x + 5;
		let x  : String <- "hELLO" in x.concat("Goodbye");
		let x  : Int <- 8 in x + 5;
		let x  : String <- "Hi" in x.concat("Howdy");
		let x  : Int <- 9 in x + 5;
		let x  : String <- "Howdy" in x.concat("Matey");
		let x  : Int <- 10 in x + 5;
		let x  : String <- "Different X" in {
			 x.concat("And different Y");
			 let x : Int <- 0 in
			 		x <- x + 5;
					 let x : Int <- 7 in
			 				x <- x + 5;
							let x : Int <- 8 in
									x <- x + 5;
									let x : Int <- 9 in
			 									x <- x + 5;
												let x : Int <- 10 in
															x <- x + 6;
															let x : Int <- 15 in
																		x <- x + 6;
			 };
														


					
	
		


		-- Case Test

		-- TEST: case order
    case someA of
      b : TestD => 1;
      c : TestC => 2;
      d : TestB => 3;
			a : TestA => 4;
      esac;
		while indexI < 10000 loop
		{
			case someZ of
      a : TestA => 1;
      b : TestB => 2;
			c : TestC => 3;
			d : TestD => 4;
			e : TestE => 1;
      f : TestF => 2;
			g : TestG => 3;
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
			indexI <- indexI + 1;
		}
		
		pool;

		someA.same_form_name1(5).same_form_name2(3).same_form_name3(2).same_form_name4(8);
		otherA <- new TestB;
		-- TEST dynamic dispatch override.
		otherA.same_form_name1(5);
		-- TEST static dispatch override.
		otherA@TestA.same_form_name1(5);
		-- TEST eval arg order
		someB.eval_method(7 * 8 + 5, 1 + 2 * 5 / 2, 77 * 77 + 2, 11 * 11 + 88 - 3);
		someB.eval_method(11 * 11 + 88 - 3, 77 * 77 + 2, 1 + 2 * 5 / 2 , 7 * 8 + 5 );
		someB.eval_method2(7 * 8 + 5, 1 + 2 * 5 / 2, 77 * 77 + 2, 11 * 11 + 88 - 3);
		someB.eval_method2(11 * 11 + 88 - 3, 77 * 77 + 2, 1 + 2 * 5 / 2 , 7 * 8 + 5 );

		case someZ of
      b : TestA => 1;
      c : TestB => 3;
			d : TestC => 2;
			a : TestD => 1;
      esac;

			while aNumber < 10000 loop 
      {

         aNumber <- aNumber + 1;
				 temp <- aNumber;
        while not (0 = aNumber)  loop 
          aNumber <- aNumber / 4
        pool; 
				aNumber <- temp;      
      } 
    pool;		

	-- TEST: perform factorial
	
	out_int(fact(15));

	-- TEST let let
			let y : Int <- 5 in 
				let x: Int <- 5 + y in x;
	-- TEST let case
			let indexK : Int <- 0, newZ : TestZ <- new TestZ in
{
			while indexK < 1000 loop
			{
				case newZ of
				a : TestA => 1;
				b : TestB => 2;
				c : TestC => 3;
				d : TestD => 4;
				e : TestE => 1;
				f : TestF => 2;
				g : TestG => 3;
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
				indexK <- indexK + 1;
			}
			
			pool;};
		

			 


	}
	};

};
class One inherits IO{};
class Two inherits IO{};
class Three  inherits IO {};

class TestA {

	-- TEST calls with same formal name
	-- TEST self attributes
	dattr4: Int <- 4;
	cattr3: Int <- 3;
	battr2: Int <- 2;
	attr1 : Int <- 1;
	same_form_name1(a : Int) : TestA {self};
	same_form_name2(a : Int) : TestA {self};
	same_form_name3(a : Int) : TestA {self};
	same_form_name4(a : Int) : Int {a};
};
class TestB inherits TestA {
	iattr9: Int <- 9;
	hattr8: Int <- 8;
	gattr7: Int <- 7;
	fattr6: Int <- 6;
	eattr5: Int <- 5;
	
	same_form_name1(a : Int) : TestA {self};
	eval_method(a : Int, b : Int, c : Int, d : Int): Int { a + b * c - d};
	eval_method2(d : Int, c : Int, b : Int,  a : Int): Int {d - c * b + a};

	};



class TestC inherits TestB {

	-- TEST attribute init super
	iattr14: Int <- 14;
	hattr13: Int <- 13;
	gattr12: Int <- 12;
	fattr11: Int <- 11;
	eattr10: Int <- 10;

};
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
class TestZ inherits TestY {
		someA : TestA <- new TestA;
		-- TEST case attrbutes
		num1 : Int <-  case someA of
		b : TestD => 1;
		c : TestC => 2;
		d : TestB => 3;
		a : TestA => 4;
		esac;

		-- TEST attribute formals
		num2 : Int <- incrementNum(num1);

		num3 : Int <- let x : Int <- 0 in
										{
											x <- x + 5;
												let y : Int <- 7 in
														y <- x + 5;
															 let x : Int <- 8 in
																	 x <- x + 5;
																	 let x : Int <- 9 in
																				x <- x + 5;
								 														let x : Int <- 10 in
											 														x <- x + 6;
											 																let x : Int <- x + 15 + x in
																															 x;
										};

		incrementNum(num2: Int) : Int {num1 + 1};


};



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
