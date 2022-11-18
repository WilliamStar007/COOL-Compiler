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
			out_string("Fact: ");
			out_int(n);
			out_string("\n");
			if n = 0 then 1 else n * fact(n - 1) fi;
		}

	};
	main() : Object {{
    
		-- TEST: void comparision and void with non void comparison
		if one = two then temp <- temp + 1 else temp <- temp * 10 fi;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		if one =  three then temp <- 7 * 7 + 7 else temp <- 77 * 18 + 5 / 2 fi;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		-- TEST substring ok
		"test".substr(0, 4);
		-- TEST: string comparison, non-void comparison
		if numOne = hello then temp <- 7 * 7 + 5 * 2 else temp <- 5 / 2 + 5 * 10 fi;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		if hello =  "hello" then temp <- 1 * 2 * 3 + 5 *7 else temp <- 1 * 2 + 888 fi;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		if hello =  "HELLO" then temp <- 7 * 7 + 2 else temp <- 7 * 6 + 2 + 4 fi;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		-- diff scope
		let x  : Int <- 5 in temp <- x + 5;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		let x  : String <- "hELLO" in hello.concat(x);
		out_string("hello : ");
		out_string(hello);
		out_string("\n");
		let x  : Int <- 8 in temp <- x + 5;
		out_string("temp : ");
		out_int(temp);
		out_string("\n");
		let x  : String <- "Hi" in hello.concat(x);
		out_string("hello : ");
		out_string(hello);
		out_string("\n");
		let x  : Int <- 9 in temp <- x + 5;
		let x  : String <- "Howdy" in x.concat("Matey");
		let x  : Int <- 10 in temp <- x + 5;
		let x  : String <- "Different X" in {
			 hello.concat("x");
			 let x : Int <- 0 in {
			out_string("x : ");
			out_int(x);
			out_string("\n");
			x <- x + 5;
			out_string("temp : ");
			out_int(temp);
			out_string("\n");
			};
					 let x : Int <- 7 in
					 {
						out_string("x : ");
						out_int(x);
						out_string("\n");
						x <- x + 5;
						out_string("x : ");
						out_int(x);
						out_string("\n");
					};
							let x : Int <- 8 in
									{
										out_string("x : ");
										out_int(x);
										out_string("\n");
										x <- x + 5;
										out_string("x : ");
										out_int(x);
										out_string("\n");
									};
									let x : Int <- 9 in
			 									{
													out_string("x : ");
													out_int(x);
													out_string("\n");
													x <- x + 5;
													out_string("x : ");
													out_int(x);
													out_string("\n");
												};
												let x : Int <- 10 in
															{
																out_string("x : ");
																out_int(x);
																out_string("\n");
																x <- x + 6;
																out_string("x : ");
																out_int(x);
																out_string("\n");
															};
															let x : Int <- 15 in
																		{
																			out_string("x : ");
																			out_int(x);
																			out_string("\n");
																			x <- x + 6;
																			out_string("x : ");
																			out_int(x);
																			out_string("\n");
																		};
			 };
		out_string("hello : ");
		out_string(hello);
		out_string("\n");
														


					
	
		
	case someA of 
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
		from3 : FromIO3 => case someB of c : TestC => 0; b : TestB => case someA of a : TestA => case someB of b : TestB => case hello of a : String => 0;
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
			out_string("indexI : ");
			out_int(indexI);
			out_string("\n");
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
	
	fact(15);

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
				out_string("indexK : ");
				out_int(indexK);
				out_string("\n");
			}
			pool;};
		

			let x  : Int <- 5 in x + 5;
			let x  : String <- "hELLO" in x.concat("Goodbye");
			let x  : Int <- 8 in x + 5;
			let x  : String <- "Hi" in x.concat("Howdy");
			let x  : Int <- 9 in x + 5;
			let x  : String <- "Howdy" in x.concat("Matey");
			let x  : Int <- 10 in x + 5;
		case someZ of
			a : TestA => let x  : Int <- 5 in x + 5;
			b : TestB => let x  : String <- "hELLO" in x.concat("Goodbye");
			c : TestC => let x  : Int <- 8 in x + 5;
			d : TestD => let x  : String <- "Hi" in x.concat("Howdy");
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

	}
	};

};
class One inherits IO{};
class Two inherits IO{};
class Three  inherits IO {};

class TestA inherits IO {

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
	eval_method(a : Int, b : Int, c : Int, d : Int): Int {{
		out_string("TestB a: ");
		out_int(a);
		out_string("\n");
		out_string("TestB b: ");
		out_int(b);
		out_string("\n");
		out_string("TestB c: ");
		out_int(c);
		out_string("\n");
		out_string("TestB d: ");
		out_int(d);
		out_string("\n");
		out_string("TestB iattr9: ");
		out_int(iattr9);
		out_string("\n");
		out_string("TestB hattr8: ");
		out_int(hattr8);
		out_string("\n");
		out_string("TestB gattr7: ");
		out_int(gattr7);
		out_string("\n");
		out_string("TestB fattr6: ");
		out_int(fattr6);
		out_string("\n");
		out_string("TestB eattr5: ");
		out_int(eattr5);
		out_string("\n");
		a + b * c - d;}};
	eval_method2(d : Int, c : Int, b : Int,  a : Int): Int {{

		out_string("TestB a: ");
		out_int(a);
		out_string("\n");
		out_string("TestB b: ");
		out_int(b);
		out_string("\n");
		out_string("TestB c: ");
		out_int(c);
		out_string("\n");
		out_string("TestB d: ");
		out_int(d);
		out_string("\n");
		out_string("TestB iattr9: ");
		out_int(iattr9);
		out_string("\n");
		out_string("TestB hattr8: ");
		out_int(hattr8);
		out_string("\n");
		out_string("TestB gattr7: ");
		out_int(gattr7);
		out_string("\n");
		out_string("TestB fattr6: ");
		out_int(fattr6);
		out_string("\n");
		out_string("TestB eattr5: ");
		out_int(eattr5);
		out_string("\n");
		d - c * b + a;}};

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
											out_string("TestZ num1: ");
											out_int(num1);
											out_string("\n");
											x <- x + 5;
											out_string("TestZ x: ");
											out_int(x);
											out_string("\n");

												let y : Int <- 7 in
														{
															out_string("TestZ y: ");
															out_int(y);
															out_string("\n");
															y <- x + 5;
														};
															 let x : Int <- 8 in
																	 {
																		
																		out_string("TestZ x: ");
																		out_int(x);
																		out_string("\n");
																		x <- x + 5;
																	};
																	 let x : Int <- 9 in
																	 {
																	 			out_string("TestZ x: ");
																	 			out_int(x);
																	 			out_string("\n");
																				x <- x + 5;
																			};
								 														let x : Int <- 10 in
											 														{
																										out_string("TestZ x: ");
																										out_int(x);
																										out_string("\n");
																										x <- x + 6;
																									};
											 																let x : Int <- x + 15 + x in
																															 {
																																out_string("TestZ x: ");
																																	out_int(x);
																																	out_string("\n");
																																
																																
																																x;};
										};

		incrementNum(num2: Int) : Int {{
			out_string("TestZ num1: ");
			out_int(num1);
			out_string("\n");
			out_string("TestZ num2: ");
			out_int(num2);
			out_string("\n");
			out_string("TestZ num3: ");
			out_int(num3);
			out_string("\n");
			num1 + 1;}};
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
